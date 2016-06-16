VM=default
DOCKER_MACHINE=/usr/local/bin/docker-machine
VBOXMANAGE=/Applications/VirtualBox.app/Contents/MacOS/VBoxManage

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

unset DYLD_LIBRARY_PATH
unset LD_LIBRARY_PATH

clear

if [ ! -f "${DOCKER_MACHINE}" ] || [ ! -f "${VBOXMANAGE}" ]; then
  echo "Either VirtualBox or Docker Machine are not installed. Please re-run the Toolbox Installer and try again."
  exit 1
fi

"${VBOXMANAGE}" list vms | grep \""${VM}"\" &> /dev/null
VM_EXISTS_CODE=$?

if [ $VM_EXISTS_CODE -eq 1 ]; then
 cat << EOF


                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/


EOF
  "${DOCKER_MACHINE}" rm -f "${VM}" &> /dev/null
  rm -rf ~/.docker/machine/machines/"${VM}"
  "${DOCKER_MACHINE}" create -d virtualbox --virtualbox-memory 2048 --virtualbox-disk-size 204800 "${VM}"
fi

VM_STATUS="$(${DOCKER_MACHINE} status ${VM} 2>&1)"
if [ "${VM_STATUS}" != "Running" ]; then
 "${DOCKER_MACHINE}" start "${VM}"
  yes | "${DOCKER_MACHINE}" regenerate-certs "${VM}"
fi

eval "$(${DOCKER_MACHINE} env --shell=bash ${VM})"

_docker_build() {

  if [[ ! -e "./Dockerfile" ]]; then
    echo "Dockerfile is required. Make sure you have it in this directory."
    return 1
  fi

  local DK_PROJ="${PWD##*/}"

  docker images --format='{{.Repository}}:{{.Tag}}' \
    | grep "$DK_PROJ":latest &> /dev/null

  if [[ "$?" = "0" ]]; then

    if [[ -e "docker-rebuild" ]]; then
      echo "Prepare to rebuild image for $DK_PROJ."

      for c in $(docker ps -a --format='{{.ID}} {{.Image}}' \
        | grep "$DK_PROJ" | cut -d" " -f1); do

        docker stop "$c" &> /dev/null
        docker rm "$c" &> /dev/null
      done

      docker rmi "$DK_PROJ":latest &> /dev/null
      rm "docker-rebuild"
    else

      echo "Image already available."
      return 1
    fi

  fi

  echo "Building an image for $DK_PROJ"
  docker build -t "$DK_PROJ":latest .
}

_docker_env_check() {

  if [[ ! -e "./docker-env.sh" ]]; then
    echo "Can't locate docker-env.sh to setup Docker for this app."
    return 1
  fi

  . ./docker-env.sh

  for link in ${IMAGE_LINKS[@]}; do

    for container in $(docker ps -a --format='{{.ID}} {{.Image}}' \
      | grep "$link" | cut -d' ' -f1); do

      local CONTAINER_FOUND=true

      docker inspect --format='{{.State.Status}}' $container  \
        | grep 'running' &> /dev/null

      if [[ "$?" = "1" ]]; then
        echo "Start $link"
        docker start $container > /dev/null
      fi
    done

    if [[ "${CONTAINER_FOUND:-false}" == "false" && $link =~ (redis|mysql|postfix) ]]; then
      echo "checking image $MATCH"
      case "$MATCH" in

        "redis" )
          echo "Create and start Redis"
          docker run -d --name redis redis:2.8.17
          ;;

        "mysql")
          echo "Create and start MySQL"
          if [[ ${DB_DATA:-""} == "" ]]; then
            docker run -d --name ${DB_CONTAINER:-mysql} -p 3306:3306 $link
          else
            docker run -d --name ${DB_CONTAINER:-mysql} -p 3306:3306 \
              -v $DB_DATA:/var/lib/mysql $link
          fi
          ;;

        "postfix")
          echo "Create and start Postfix"
          if [[ ${EMAIL_ADDRESS:-""} != "" || ${EMAIL_PASSWORD:-""} != "" ]]; then
            docker run -d --name=postfix -p 25:25 \
              -e EXT_RELAY_HOST=smtp.gmail.com \
              -e EXT_RELAY_PORT=587 \
              -e SMTP_LOGIN=$EMAIL_ADDRESS \
              -e SMTP_PASSWORD=$EMAIL_PASSWORD \
              -e USE_TLS=yes \
              -e DEFAULT_RECIPIENT=$EMAIL_ADDRESS \
              vhugo/postfix-relay
          else
            echo "Use EMAIL_ADDRESS and EMAIL_PASSWORD to step the relay."
          fi
          ;;
      esac
    fi
  done
}

_docker_container_check() {
  local _rgx="^$1$"
  if [[ "$(docker ps --format='{{.Names}}' \
    | grep -oE $_rgx)" = "" ]]; then
    echo "Could find a container called \"$1\""
    return 1
  fi
}

_docker_add() {
   while :
    do
      case "$1" in
        -p | --port)
          if [[ "$(echo $2 | grep -oE '(\d+\:\d+|\d+)')" = "" ]]; then
            echo "Port doesn't look right."
            return 1
          fi
          local port="-p $2"
          shift 2
          ;;
        -l | --links)
          local -a links
          links=($links $2)
          shift 2
          ;;
        -f | --force)
          local force_run=true
          shift 1
          ;;
        -v | --volume)
          local -a volumes
          volumes=($volumes $2)
          shift 2
          ;;
        --) # End of all options
          shift
          break
          ;;
        -*)
          echo "Error: Unknown option: $1" >&2
          return 1
          ;;
        *)  # No more options
          break
          ;;
      esac
    done

    local link_arg
    for lnk in ${links[@]}; do
      _docker_container_check $lnk
      link_arg="$link_arg --link $lnk"
    done

    local volume_arg
    for vlm in ${volumes[@]}; do
      volume_arg="$volume_arg -v $vlm"
    done

    # Clean up rest to fit as a container name sufix
    local image="${PWD##*/}"
    local container_name="$image-$(echo ${@} | sed -e 's/[^a-zA-Z0-9]/_/g' \
      | sed -e 's/_\{2,\}/_/g' | tr '[:upper:]' '[:lower:]')"

    _check_container_entry $container_name
    if [[ "$?" = "1" ]]; then
      return 1
    fi

    echo "[IMPORTANT]: Press control+c to detach"
    eval "docker run -t --name $container_name $port $link_arg $volume_arg $image"
}

_check_container_entry() {
    local image="${PWD##*/}"

    if [[ "$1" = "$image-" ]]; then
      echo "Ops! You forgot container's name at the end"
      return 1
    fi
}

_docker_list_containers() {
  local _app_rgx="^${PWD##*/}\-"
  echo "$(docker ps -a --format='{{.Names}}' | grep -oE $_app_rgx)"
}

dkr() {

  _docker_env_check
  if [[ "$?" = "1" ]]; then
    return 1
  fi

  case "$1" in
    add)
      shift 1
      _docker_add "$@"
      return 0
      ;;
    restart)
      echo "Implement this"
      return 0
      ;;
    destroy)
      echo "Implement this"
      return 0
      ;;
    list)
      _docker_list_containers
      return 0
      ;;
    build)
      _docker_build
      return 0
      ;;
    clean)
      echo "Implement this"
      return 0
      ;;
  esac

  local image="${PWD##*/}"
  local container_name="$image-$(echo $DEFAULT_CONTAINER[1] | sed -e 's/[^a-zA-Z0-9]/_/g' \
    | sed -e 's/_\{2,\}/_/g' | tr '[:upper:]' '[:lower:]')"

  _docker_container_check $container_name
  if [[ "$?" = "1" ]]; then
    echo "Creating default container"
    eval "$DEFAULT_CONTAINER[2] $DEFAULT_CONTAINER[1]"
  fi

  container_name="$image-$(echo $1 | sed -e 's/[^a-zA-Z0-9]/_/g' \
    | sed -e 's/_\{2,\}/_/g' | tr '[:upper:]' '[:lower:]')"

  _docker_container_check $container_name
   if [[ "$?" = "1" ]]; then
    return 1
  fi

 shift 1
  eval "docker exec -ti $container_name $@"
}

# function dkcleanup() {
#   local BADIMAGES=""
#   local PARENTS=""
#   for i in $(docker images -a --format='{{ .Repository}} {{.ID}}' \
#     | grep none | cut -d' ' -f2); do
#
#     echo "I:$i"
#     BADIMAGES+=($i)
#
#     for p in $(docker inspect --format='{{ .Parent }}' ${i} | cut -d':' -f2); do
#       echo "P:$p"
#       PARENTS+=(${p:0:12})
#     done
#   done
#
#   echo "${BADIMAGES[@]/#/\n}" | sort
#   echo "${PARENTS[@]/#/\n}" | sort
# }


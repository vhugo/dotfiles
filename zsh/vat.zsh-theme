local ret_status="%(?:%{$FG[066]%}➜ :%{$FG[197]%}➜ %s)"
PROMPT='${ret_status} %{$FG[237]%}%n%{$reset_color%}%{$FG[066]%}@%m%{$reset_color%}%{$fg_bold[green]%}%p %{$FG[093]%}%c%{$reset_color%} $(git_super_status)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="b:"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" ("
ZSH_THEME_GIT_PROMPT_BRANCH="%{$FG[197]$FX[bold]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[037]$FX[bold]%}%{Ξ%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$FG[197]$FX[bold]%}%{!%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$FG[208]$FX[bold]%}%{±%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{⁃%G%}"

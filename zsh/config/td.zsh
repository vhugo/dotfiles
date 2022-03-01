export TODO_PATH=$HOME/private/todos
export TODO_BOOKS=books.json
export TODO_DEFAULT=default.json

alias _td=/usr/local/bin/td
alias tdbooks='TODO_DB_PATH=$TODO_PATH/$TODO_BOOKS _td'
alias td='TODO_DB_PATH=$TODO_PATH/$TODO_DEFAULT _td'

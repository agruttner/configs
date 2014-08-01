# Shortcuts to folders
alias wk='cd $HOME/Source/com.tappmo'
alias ginx='cd $HOME/Source/ginx'

# Building
alias mk='mvn clean install -T 1C -DskipTests'
alias mks='wk;mvn install -pl server/fender -pl server/atom -pl server/deebo -pl server/hermes -DskipTests'
alias mki='mvn clean install -Dintegration=launch'
alias mka='wk;mvn install -pl server/atom -DskipTests'
alias mkd='wk;mvn install -pl server/deebo -DskipTests'
alias mkf='wk;mvn install -pl server/fender -DskipTests'
alias mkfa='wk;mvn install -pl server/api/fender -DskipTests'

# Running
alias runa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action start'
alias runh='$TAPPMO_HOME/scripts/manage_server.py --server hermes --action start'
alias runf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action start'
alias runr='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action start'
alias runav='$TAPPMO_HOME/scripts/manage_server.py --server atom --action start --log_to_stdout'
alias runhv='$TAPPMO_HOME/scripts/manage_server.py --server hermes --action start --log_to_stdout'
alias runfv='$TAPPMO_HOME/scripts/manage_server.py --server fender --action start --log_to_stdout'
alias runrv='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action start --log_to_stdout'
alias stopa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action stop'
alias stoph='$TAPPMO_HOME/scripts/manage_server.py --server hermes --action stop'
alias stopd='$TAPPMO_HOME/scripts/manage_server.py --server deebo --action stop'
alias stopf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action stop'
alias stopr='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action stop'
alias run='runa; runf; runr; runh'
alias runv='runav; runfv; runrv; runhv'
alias stop='stopa; stopd; stopf; stopr; stoph'

#run fake data
alias fd='wk;$TAPPMO_HOME/fakedata/src/reinit_data --host http://localhost:8081 --secure_rpc_url http://localhost:8082 --mode dev'

#git
alias gts='git status'
alias gtd='git diff origin/master'
alias gtds='git diff origin/master --stat'
alias gtp='git pull origin master; git fetch'
alias gtb='git branch'
alias gtm='git merge master'
alias gta='git add -A'
alias gtcm='git commit -a'
alias gtc='git checkout'

# Other
alias tw='vim $HOME/Dropbox/todo_work.txt'
alias th='vim $HOME/Dropbox/todo_home.txt'
alias ta='vim $HOME/Dropbox/todo_apartment.txt'
alias tb='vim $HOME/Dropbox/to_buy.txt'
alias update_licenses='mvn license:add-third-party -Dlicense.useMissingFile=true -Dlicense.excludedGroups="com.goindex"   -Dlicense.outputDirectory=license -Dlicense.missingFile=license/THIRD-PARTY.properties'
alias mqh='history | grep mq'
alias lsl='ls -l'

function mq() {
  # prod:
  #mongo 10.0.201.121:27017/goindex --eval $1
  # canary:
  mongo 10.0.201.179:27017/goindex --eval $1
}

#launch IntelliJ
alias lij='/Applications/IntelliJ\ IDEA\ 13\ CE.app/Contents/MacOS/idea > /dev/null 2>&1 &'

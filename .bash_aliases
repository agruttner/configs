# Shortcuts to folders
alias wk='cd $HOME/Source/com.tappmo'
alias fr='cd $HOME/Source/com.tappmo/fender/WebContent/WEB-INF'
alias aws='cd $HOME/Source/com.tappmo/ops/aws'
alias vag='cd $OPS_HOME/vagrant/cluster'

# Building
alias mk='mvn clean install'
alias mks='mvn clean install -pl server/fender -pl server/atom -pl server/deebo -pl server/hermes -DskipTests'
alias mki='mvn clean install -Dintegration=launch'
alias mka='mvn clean install -pl server/atom -am -DskipTests'
alias mkd='mvn clean install -pl server/deebo -am -DskipTests'
alias mkf='mvn clean install -pl server/fender -am -DskipTests'

# Running
alias runa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action start'
alias runf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action start --fenderJarMode false'
alias runr='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action start'
alias runav='$TAPPMO_HOME/scripts/manage_server.py --server atom --action start --log_to_stdout'
alias runfv='$TAPPMO_HOME/scripts/manage_server.py --server fender --action start --fenderJarMode false --log_to_stdout'
alias runrv='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action start --log_to_stdout'
alias stopa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action stop'
alias stopd='$TAPPMO_HOME/scripts/manage_server.py --server deebo --action stop'
alias stopf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action stop'
alias stopr='$TAPPMO_HOME/scripts/manage_server.py --server raptor --action stop'
alias run='runa; runf; runr'
alias runv='runav; runfv; runrv'
alias stop='stopa; stopd; stopf; stopr'

#run fake data
alias fd='wk;$TAPPMO_HOME/fakedata/src/reinit_data --host http://localhost:8081 --secure_rpc_url http://localhost:8082'

#git
alias gts='git status'
alias gtd='git diff origin/master'
alias gtds='git diff origin/master --stat'
alias gtp='git pull origin master; git fetch'

# Other
alias mr='$HOME/Source/com.tappmo/server/src/tools/make_receipt.py --host http://localhost:8080 --consumer_id tom --pin 88876 --store_id gap'
alias tw='vim $HOME/Dropbox/todo_work.txt'
alias th='vim $HOME/Dropbox/todo_home.txt'
alias ta='vim $HOME/Dropbox/arch'
alias update_licenses='mvn license:add-third-party -Dlicense.useMissingFile=true -Dlicense.excludedGroups="com.goindex"   -Dlicense.outputDirectory=license -Dlicense.missingFile=license/THIRD-PARTY.properties'

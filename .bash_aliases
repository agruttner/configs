# Shortcuts to folders
alias wk='cd $HOME/Source/com.tappmo'
alias fr='cd $HOME/Source/com.tappmo/fender/WebContent/WEB-INF'
alias fd='cd $HOME/Source/com.tappmo/server/src/tools/fakedata'
alias aws='cd $HOME/Source/com.tappmo/ops/aws'
alias vag='cd $OPS_HOME/vagrant/cluster'

# Building
alias mk='mvn clean install'
alias mks='mvn clean install -pl fender -pl atom -pl deebo -pl hermes -DskipTests'
alias mki='mvn clean install -Dintegration=launch'
alias mka='mvn clean install -pl atom -DskipTests'
alias mkd='mvn clean install -pl deebo -DskipTests'
alias mkf='mvn clean install -pl fender -DskipTests'

# Running
alias runa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action start'
alias rund='$TAPPMO_HOME/scripts/manage_server.py --server deebo --action start'
alias runf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action start --fenderJarMode false'
alias stopa='$TAPPMO_HOME/scripts/manage_server.py --server atom --action stop'
alias stopd='$TAPPMO_HOME/scripts/manage_server.py --server deebo --action stop'
alias stopf='$TAPPMO_HOME/scripts/manage_server.py --server fender --action stop'
alias run='runa; rund; runf'
alias stop='stopa; stopd; stopf'

# Other
alias mr='$HOME/Source/com.tappmo/server/src/tools/make_receipt.py --host http://localhost:8080 --consumer_id tom --pin 88876 --store_id gap'
alias tw='vim $HOME/Dropbox/todo_work.txt'
alias th='vim $HOME/Dropbox/todo_home.txt'

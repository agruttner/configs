# Shortcuts to folders
alias wk='cd $HOME/Source/com.tappmo'
alias ginx='cd $HOME/Source/ginx'
alias ios='cd $HOME/Source/ios/projects/libraries/IXBeanstalkLib'
alias ops='cd $HOME/Source/ops'
alias nfs='cd /Volumes/NFS/'

# Building
alias mk='mvn clean install -T 1C -DskipTests'
alias mks='wk;mvn install -pl server/fender -pl server/atom -pl server/deebo -pl server/hermes -DskipTests'
alias mki='mvn clean install -Dintegration=launch'
alias mka='wk;mvn install -pl server/atom -DskipTests'
alias mkd='wk;mvn install -pl server/deebo -DskipTests'
alias mkf='wk;mvn install -pl server/fender -DskipTests'
alias mkfa='wk;mvn install -pl server/api/fender -DskipTests'

#git
alias gts='git status'
alias gtd='git diff'
alias gtdo='git diff origin/master'
alias gtds='git diff origin/master --stat'
alias gtp='git pull origin master; git fetch'
alias gtb='git branch'
alias gtm='git merge master'
alias gta='git add -A'
alias gtcm='git commit -a'
alias gtcma='gta && git commit --amend'
alias gtc='git checkout'
alias ggi='git grep -i'

# Other
alias tw='vim $HOME/Dropbox/todo_work.txt'
alias th='vim $HOME/Dropbox/todo_home.txt'
alias ta='vim $HOME/Dropbox/todo_apartment.txt'
alias tb='vim $HOME/Dropbox/to_buy.txt'
alias update_licenses='mvn license:add-third-party -Dlicense.useMissingFile=true -Dlicense.excludedGroups="com.goindex"   -Dlicense.outputDirectory=license -Dlicense.missingFile=license/THIRD-PARTY.properties'
alias lsl='ls -l'

#launch IntelliJ
alias lij='/Applications/IntelliJ\ IDEA\ 14\ CE.app/Contents/MacOS/idea > /dev/null 2>&1 &'

#ios
alias sync_revellib='rsync -r ~/Source/ios/projects/libraries/IXBeanstalkLib/build/sym/Index ~/Source/revelExample/lib/'

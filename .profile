#PS1='[\D{%d.%m.%y} \t \u:\w ]$ '
if [ -f "$HOME/.bash_ps1" ]; then
	. "$HOME/.bash_ps1"
fi
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# turn on vi keybindings for command line
set -o vi

# get all the boxen goodness
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
source /opt/boxen/data/virturalenvs/goindex/bin/activate

AWS="$HOME/Source/aws"

export TOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.34/libexec
export ANDROID_HOME=$HOME/android-sdks
export BUILDTYPE=command_line
export EDITOR="vim"
export TAPPMO_HOME=$HOME/Source/com.tappmo
export JAVA_HOME=$(/usr/libexec/java_home)
export AWS_IAM_HOME="$AWS/IAMCli-1.5.0"
export AWS_CREDENTIAL_FILE="$AWS_IAM_HOME/aws-credentials"
export MAVEN_OPTS="-Xmx999m -XX:MaxPermSize=128m"
export OPENSSL_CONF="$HOME/Source/ssl/openssl.cnf"
export CHEF_REPO_PATH="$HOME/Source/chef-repo"
export OPS_HOME="$HOME/Source/ops"
export KNIFE_HOME="$OPS_HOME/vagrant/cluster/chef"

export PATH="$PATH:$HOME/Source/arcanist/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$AWS/AWS-ElasticBeanstalk-CLI-2.3.1/eb/macosx/python2.7"
export PATH="$PATH:$AWS_IAM_HOME/bin"
export PATH="$PATH:$HOME/android-sdks/platform-tools"

export PYTHONPATH=$TAPPMO_HOME/site_packages:$HOME/Source/ops/site_packages

function vknife() {
  knife $@ -c ~/.chef/vagrant_knife.rb
}


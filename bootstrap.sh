# jenkins needs at least Java 7
apt-get install -y openjdk-7-jre openjdk-7-jdk

# get the key, add the repository for jenkins and install
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install -y jenkins

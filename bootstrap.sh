# get the key, add the repository for jenkins and install
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install -y jenkins

# jenkins needs at least Java 7
apt-get install -y openjdk-7-jre openjdk-7-jdk
update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# restart so jenkins uses the correct java version
/etc/init.d/jenkins restart

# get the cli jar.
# because it takes some time for the jenkins server to start and wget stops on connection issues,
# do this in a loop until it succeeds but wait in between tries
while true;do
	wget http://localhost:8080/jnlpJars/jenkins-cli.jar && break
	sleep 2
done
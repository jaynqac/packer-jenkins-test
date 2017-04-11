#!/bin/bash

# install wget
#yum upgrade
yum install -y wget

# download java tarball from the internet and store in /opt
cd /opt
# no cookies/header is used because on the oracle website you have to accept the licenses so this prevents the site from requesting it
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz

# extract java
tar -zxvf jdk-8u111-linux-x64.tar.gz

# install java
update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_111/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_111/bin/javac 100

export JAVA_HOME=/opt/jdk1.8.0_111/jre
export JRE_HOME=/opt/jdk1.8.0_111/jre
export PATH=$JAVA_HOME/bin:$PATH
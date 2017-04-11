#!/bin/bash

yum install -y wget nano

#create tomcat group and tomcat user, adds user to group
groupadd tomcat
useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

#download tomcat tarball
cd /opt
#wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.13/bin/apache-tomcat-8.5.13.tar.gz
wget http://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz
tar -zxvf /opt/apache-tomcat-7.0.77.tar.gz
rm /opt/apache-tomcat-7.0.77.tar.gz  

# Configure Tomcat Manager on Web Application
sed -i '35a  <role rolename="admin-gui"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '36a  <role rolename="admin-script"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '37a  <role rolename="manager-gui"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '38a  <role rolename="manager-script"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '39a  <role rolename="manager-jmx"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '40a  <role rolename="manager-status"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '41a  <user username="admin" password="password" roles="admin-gui,admin-script,manager-gui,manager-script,manager-jmx,manager-status"/>' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '34d' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '42,46d' /opt/apache-tomcat-7.0.77/conf/tomcat-users.xml
sed -i '24,25d'	/opt/apache-tomcat-7.0.77/webapps/host-manager/META-INF/context.xml
sed -i '24,25d' /opt/apache-tomcat-7.0.77/webapps/manager/META-INF/context.xml

# Run the container
# docker run -d -p 8080:8080 test-image:v1
#!/bin/bash
STARTSCRIPT="/u01/hddt/apache-tomcat/bin/startup.sh"

#Start tomcat
"$STARTSCRIPT"

tail -f /u01/hddt/apache-tomcat/logs/catalina.out

#FROM java_net_tools_8:1.1 
FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y software-properties-common

RUN  mkdir /var/run/sshd && \
  chmod 0755 /var/run/sshd && \
  useradd -p $(openssl passwd -1 hddtpassword) --create-home --shell /bin/bash --groups sudo hddt

RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk openjdk-8-jre

RUN apt-get update && \
  apt-get install -y netcat net-tools ssh iputils-ping sudo vim

RUN apt install -y telnet

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV CATALINA_PID /u01/hddt/tomcat9999/bin/tomcat.pid


WORKDIR /u01/hddt
RUN chown -R hddt:hddt /u01/hddt/
RUN ln -snf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && echo Asia/Ho_Chi_Minh > /etc/timezon
RUN apt install -y ntp

COPY --chown=hddt:hddt ./start.sh /u01/hddt/start.sh
RUN chmod +x /u01/hddt/start.sh
COPY --chown=hddt:hddt ./apache-tomcat /u01/hddt/apache-tomcat

USER hddt
EXPOSE 9999 
ENTRYPOINT ["/u01/hddt/start.sh"]

#RUN /u01/hddt/start.sh
#CMD ["./tomcat9999_bk/bin/catalina.sh","run"]
#CMD tail -f /u01/hddt/tomcat9999/logs/catalina.out
#CMD ["apache2-foreground"]
#RUN chown -R hddt:hddt /u01/hddt/
#RUN chown hddt:hddt /u01/hddt/start.sh

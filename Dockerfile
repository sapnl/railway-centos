FROM centos:centos7
RUN yum update -y
ENV LANG en_US.utf8
ARG Ngrok
ARG Password
ARG re
RUN yum install ssh wget unzip openssh-server openssh-clients -y > /dev/null 2>&1
RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip
RUN mkdir /run/sshd
RUN ssh-keygen -A
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo root:root|chpasswd
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306

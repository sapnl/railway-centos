FROM centos:centos7
RUN yum update -y
ENV LANG en_US.utf8
ARG Ngrok
ARG Password
ARG re
ENV re=${re}
ENV Password=${Password}
ENV Ngrok=${Ngrok}
RUN yum install ssh wget unzip -y > /dev/null 2>&1
RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip
RUN echo "./ngrok config add-authtoken ${Ngrok} &&" >>/1.sh
RUN echo "./ngrok tcp 22 --region ${re} &>/dev/null &" >>/1.sh
RUN mkdir /run/sshd
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo root:${Password}|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306

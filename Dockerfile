FROM centos:centos7
RUN yum update -y
ENV LANG en_US.utf8
ARG Ngrok
ARG Password
ARG re
RUN yum install ssh wget unzip -y > /dev/null 2>&1
RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip
RUN systemctl start sshd
RUN ./ngrok config add-authtoken 2K1EwkoYEzrBYY4Z3r07O2Rv4zC_qwB4o622Ew2hqLvFqCBz
RUN ./ngrok tcp 22 --region us
RUN mkdir /run/sshd
RUN echo root:root3|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306
CMD  /1.sh

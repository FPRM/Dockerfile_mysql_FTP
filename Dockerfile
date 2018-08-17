FROM mysql:latest

MAINTAINER florian pereme <florian.pereme@altran.com>


## install package and dependecies for python 3

RUN apt-get update 


RUN apt-get install -y openssh-server 



# install mysql
UN mkdir -p /var/run/sshd
RUN echo 'root:medica' | chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


EXPOSE 22


CMD /usr/sbin/sshd -D
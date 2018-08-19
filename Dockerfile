FROM mysql:latest

MAINTAINER florian pereme <florian.pereme@altran.com>


## install package and dependecies for python 3

## install package and dependecies for python 3
RUN apt-get update 
  

RUN apt get install -y python3-pip 
RUN apt get install -y python3-dev 
RUN apt get install -y openssh-server 
RUN apt get install -y git 
RUN cd /usr/local/bin \
&& ln -s /usr/bin/python3 python \
RUN pip3 install --upgrade pip


#install mysql server

RUN apt-get install -y mysql-server mysql-client  
RUN mysqladmin -u root password mypassword

# install mysql
UN mkdir -p /var/run/sshd
RUN echo 'root:medica' | chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


EXPOSE 22


CMD /usr/sbin/sshd -D
FROM centos:centos7

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum -y update; yum clean all
RUN yum -y install nodejs; yum clean all
RUN yum -y install git; yum clean all
RUN yum -y install openssh-server passwd; yum clean all
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
EXPOSE 22
RUN ./start.sh
RUN cd /root; git clone https://github.com/ShuyunFF2E/ccms-components
RUN cd /root/ccms-components; npm install
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
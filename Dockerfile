FROM centos:7
MAINTAINER Carlos Fernando Gamboa "cgamboa@bnl.gov"

RUN yum upgrade -y

RUN groupadd -g 74 -r sshd
RUN useradd -c "Privilege-separated SSH" -u 74 -g sshd  -s /sbin/nologin \
  -s /sbin/nologin -r -d /var/empty/sshd sshd 2> /dev/null

RUN yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/epel-release-7-11.noarch.rpm
RUN yum install -y yum-priorities crudini
RUN yum install -y http://ngtech.co.il/repo/centos/7/squid-repo-1-1.el7.centos.noarch.rpm 

RUN yum install -y squid
ADD ./start.sh /etc/start.sh
RUN chmod +x /etc/start.sh

CMD ["/etc/start.sh"]

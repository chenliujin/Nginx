FROM centos:latest 

MAINTAINER liujin.chen <liujin.chen@qq.com>

RUN yum update -y

# 1.修改时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

# version: 1.12.1
RUN echo '[nginx]' > /etc/yum.repos.d/nginx.repo && \
    echo 'name=nginx repo' >> /etc/yum.repos.d/nginx.repo && \
    echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgcheck=0' >> /etc/yum.repos.d/nginx.repo && \
    echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo 

RUN yum install -y nginx && \
    yum clean all && \
    rm -f /etc/yum.repos.d/nginx.repo

RUN rm -f /usr/share/nginx/html/* && \
    mkdir /usr/share/nginx/html/healthz && \
    echo '<?php echo "hello world!";' > /usr/share/nginx/html/healthz/index.php

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

RUN systemctl enable nginx

COPY ./conf/conf.d /etc/nginx/conf.d

VOLUME ["/var/log/nginx"]

EXPOSE 80 443

CMD ["/usr/sbin/init"]

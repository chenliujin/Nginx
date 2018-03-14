FROM centos:7.4.1708-beta.1

MAINTAINER liujin.chen <liujin.chen@qq.com>

# nginx.repo
RUN echo '[nginx]' > /etc/yum.repos.d/nginx.repo && \
    echo 'name=nginx repo' >> /etc/yum.repos.d/nginx.repo && \
    echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgcheck=0' >> /etc/yum.repos.d/nginx.repo && \
    echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo 

# version: 1.12.2
RUN yum install -y nginx 
RUN systemctl enable nginx

# healthz
RUN rm -f /etc/nginx/conf.d/default.conf
RUN mkdir -p /data/www/healthz && \
    echo '<?php echo "ok";' > /data/www/healthz/index.php

VOLUME ["/var/log/nginx"]

EXPOSE 80 443

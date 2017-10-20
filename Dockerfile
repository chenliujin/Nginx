FROM centos:latest 

MAINTAINER liujin.chen <liujin.chen@qq.com>

# 1.修改时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

# 2. repo
RUN echo '[nginx]' > /etc/yum.repos.d/nginx.repo && \
    echo 'name=nginx repo' >> /etc/yum.repos.d/nginx.repo && \
    echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgcheck=0' >> /etc/yum.repos.d/nginx.repo && \
    echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo 

# 3. version: 1.12.2
RUN yum install -y nginx && \
    yum clean all && \
    rm -f /etc/yum.repos.d/nginx.repo

# 4. healthz
#RUN rm -f /etc/nginx/conf.d/default.conf
#RUN rm -f /usr/share/nginx/html/* && \
RUN mkdir /usr/share/nginx/html/healthz && \
    echo '<?php echo "ok";' > /usr/share/nginx/html/healthz/index.php

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

RUN systemctl enable nginx

VOLUME ["/var/log/nginx"]

EXPOSE 80 443

CMD ["/usr/sbin/init"]

FROM centos:latest 

MAINTAINER liujin.chen <liujin.chen@qq.com>

RUN yum update -y

RUN echo '[nginx]' > /etc/yum.repos.d/nginx.repo && \
    echo 'name=nginx repo' >> /etc/yum.repos.d/nginx.repo && \
    echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgcheck=0' >> /etc/yum.repos.d/nginx.repo && \
    echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo 

RUN yum install -y nginx && \
    yum clean all;

RUN mkdir /usr/share/nginx/html/healthz && \
    mv /usr/share/nginx/html/*.html /usr/share/nginx/html/healthz/

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

RUN systemctl enable nginx;
#
#COPY ./etc/nginx/nginx.conf		/etc/nginx/
#COPY ./etc/nginx/conf.d/default.conf 	/etc/nginx/conf.d/
#
VOLUME ["/var/log/nginx"]

EXPOSE 80 443

CMD ["/usr/sbin/init"]

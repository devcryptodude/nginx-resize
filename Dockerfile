FROM nginx

RUN apt-get -y update
RUN apt-get install -y wget vim curl iproute2 iputils-ping gnupg2
RUN echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list
RUN wget https://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
RUN apt-get -y update
RUN apt-get install -y nginx nginx-module-image-filter 

RUN mkdir -p /var/www/cache
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

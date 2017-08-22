#
# test Webserver Dockerfile
#
FROM osh-test/osh-test-common:latest

#================================================   
LABEL version="1.0"
LABEL description="Webserver NGINX + PHP-FPM Container"

#================================================   
# Maintainer list if you have a question
MAINTAINER Matthieu Nuaud <matthieu.nuaud@capgemini.com>

ENV DOCKAGE_WEBROOT_DIR=/var/www/html \
    DOCKAGE_DATA_DIR=/data \
    DOCKAGE_LOG_DIR=/var/log

# Install packages
RUN apk --no-cache add php7 \
                       php7-fpm \
                       php7-mysqli \
                       php7-json \
                       php7-openssl \
                       php7-curl \
                       php7-zlib \
                       php7-xml \
                       php7-phar \
                       php7-intl \
                       php7-dom \
                       php7-xmlreader \
                       php7-ctype \
                       php7-mbstring \
                       php7-gd \
                       nginx supervisor curl

#================================================ 
# Configure nginx
RUN mkdir -p /usr/share/nginx/cache
RUN rm /etc/nginx/conf.d/default.conf

#================================================ 
# Copy conf files to etc
COPY etc/ /etc/

#================================================
# Disable PHP-FPM daemonize for supervisor 	   
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php7/php-fpm.conf 
RUN mkdir /run/php/

#================================================ 
# Add application
RUN mkdir -p ${DOCKAGE_WEBROOT_DIR}
VOLUME ["$DOCKAGE_DATA_DIR", "$DOCKAGE_LOG_DIR"]
#WORKDIR ${DOCKAGE_WEBROOT_DIR}
COPY src/ ${DOCKAGE_WEBROOT_DIR}/

#================================================ 
# Expose ports
EXPOSE 80 443 9000

#================================================ 
# Cleaning up
RUN rm -rf /var/cache/apk/*

#================================================ 
# Entrypoint script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

#================================================ 
# Startup process
CMD ["/docker-entrypoint.sh"]


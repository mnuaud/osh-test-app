#
# test Webserver Dockerfile
#
FROM osh-test/osh-test-base:latest

#================================================   
LABEL version="1.0"
LABEL description="Webserver NGINX + PHP-FPM Container"

#================================================   
# Maintainer list if you have a question
MAINTAINER Matthieu Nuaud <matthieu.nuaud@capgemini.com>

#================================================
# Update the package repository
RUN apt-get update

#================================================
# Upgrade packages
RUN apt-get -y upgrade --fix-missing

#================================================
# Install Nginx webserver
RUN apt-get install -y nginx

#================================================
# Install PHP-FPM 7.0 & required PHP 7.0 modules
RUN apt-get install -y php7.0-fpm \
                       php7.0-zip \
                       php7.0-mbstring \
                       php7.0-xml \
                       php7.0-curl \
                       php7.0-pdo \
                       php7.0-gd \
                       php7.0-json \
                       php7.0-mysql \					   
                       php7.0-opcache \	
                       php7.0-mcrypt \
                       php7.0-soap \
                       php7.0-intl \
                       php-xdebug

#================================================
# Disable PHP-FPM daemonize for supervisor 	   
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf 
RUN mkdir /run/php/

#================================================ 
# Copy conf files to etc
COPY etc/ /etc/

#================================================ 
# Create ws directory
RUN mkdir -p /var/www/testsite


#================================================
# Install new relic
# RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
# RUN wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
# RUN apt-get update
# RUN apt-get install newrelic-php5
# RUN newrelic-install install

#================================================ 
# Entrypoint script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

#================================================ 
# Expose ports : HTTP XDEBUG
EXPOSE 80 9000

#================================================ 
# Startup process
CMD ["/docker-entrypoint.sh"]

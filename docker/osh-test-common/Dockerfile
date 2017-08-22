#
# Shared container structure with common tools 
#
FROM alpine

#================================================   
LABEL version="1.0"
LABEL build="2017-07-10"
LABEL description="alpine base container with common tools"

#================================================   
# Maintainer list if you have a question
MAINTAINER Matthieu Nuaud <matthieu.nuaud@capgemini.com>

#================================================   
# Global ENV variables
ENV LANG C.UTF-8

#================================================
# Copy conf files to etc
COPY etc/ /etc/

#================================================
# Link the timezone to Paris
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris  /etc/localtime

#================================================      
# Install common packages
RUN apk add --no-cache  curl \
                       net-tools \
                       iputils \
                       zip \
                       unzip \
                       rsyslog \
                       logrotate \
                       supervisor
#dev tools - remove from prod to limit image size
#                       bash \
#                       vim \
#                       less \
#                       git \                       
#================================================   
# Install & Update SSL Certificates
RUN apk add --no-cache ca-certificates && update-ca-certificates

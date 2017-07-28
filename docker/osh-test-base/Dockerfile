#
# Shared container structure with common tools 
#
FROM ubuntu:16.04

#================================================   
LABEL version="1.0"
LABEL build="2017-07-10"
LABEL description="ubuntu:16.04 base container with common tools"

#================================================   
# Maintainer list if you have a question
MAINTAINER Matthieu Nuaud <matthieu.nuaud@capgemini.com>

#================================================   
# Global ENV variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

#================================================
# Copy conf files to etc
COPY etc/ /etc/

#================================================
# Link the timezone to Paris
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris  /etc/localtime

#================================================
# Update the package repository
RUN apt-get update

#================================================      
# Install common packages
RUN apt-get install -y --no-install-recommends curl \
                                               git \
                                               zip \
                                               unzip \
                                               net-tools \
                                               supervisor \
                                               vim \
                                               less \
                                               rsyslog \
                                               iputils-ping \
                                               logrotate 
#================================================   
# Install & Update SSL Certificates
RUN apt-get install -y ca-cacert ca-certificates && update-ca-certificates

#================================================
# Upgrade packages
RUN apt-get -y upgrade --fix-missing

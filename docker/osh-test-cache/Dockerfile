#
# Test Cache Dockerfile
#
#FROM osh-test/osh-test-base:latest
FROM ubuntu:16.04

#================================================   
LABEL version="1.0"
LABEL description="Redis cache container"

#================================================   
# Maintainer list if you have a question
MAINTAINER Matthieu Nuaud <matthieu.nuaud@capgemini.com>

#================================================      
# Install common packages
RUN apt-get install -y redis-server
 
# Redis socket tuning
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
RUN echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
RUN echo 'sysctl -w net.core.somaxconn=65535'  >> /etc/rc.local

#================================================ 
# Copy conf files to etc
COPY ./etc/ /etc/
 
#================================================ 
# Entrypoint script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

#================================================ 
# Cleaning APT repository
RUN rm -rf /var/lib/apt/lists/*

#================================================ 
# Expose ports : REDIS
EXPOSE 6379

#================================================ 
# Startup process
CMD ["/docker-entrypoint.sh"]


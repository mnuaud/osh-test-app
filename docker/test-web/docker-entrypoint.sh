#!/bin/bash

export XDEBUG_INI_PATH="/etc/php/7.0/fpm/conf.d/20-xdebug.ini"

if [ "$PHP_XDEBUG_ENABLED" -eq "1" ]; then
     sed -i 's/^;zend_extension.*/zend_extension = xdebug.so/' $XDEBUG_INI_PATH
fi

if [ "$PHP_XDEBUG_AUTOSTART" -eq "0" ]; then
     sed -i 's/^xdebug.remote_autostart.*/xdebug.remote_autostart = 0/' $XDEBUG_INI_PATH
fi

if [ "$PHP_XDEBUG_REMOTE_CONNECT_BACK" -eq "0" ]; then
     sed -i 's/^xdebug.remote_connect_back.*/xdebug.remote_connect_back = 0/' $XDEBUG_INI_PATH
fi

if [ -n "$PHP_XDEBUG_REMOTE_HOST" ]; then
     sed -i 's/^xdebug.remote_host.*/'"xdebug.remote_host = ${PHP_XDEBUG_REMOTE_HOST}"'/' $XDEBUG_INI_PATH
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
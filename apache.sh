#!/bin/sh

cd `dirname $0`
./core.sh "httpd" "sudo /etc/init.d/httpd restart"

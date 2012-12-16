#!/bin/sh

cd `dirname $0`
./core.sh "mysqld" "sudo /etc/init.d/mysqld restart"

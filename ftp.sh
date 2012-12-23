#!/bin/sh

cd `dirname $0`
./core.sh "vsftpd" "sudo /etc/init.d/vsftpd restart"

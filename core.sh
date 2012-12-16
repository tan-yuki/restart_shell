#!/bin/sh

cd `dirname $0`
basedir=`pwd`

logger()
{
	echo "[`date +'%Y/%m/%d %H:%M:%S'`] $1" >> ${basedir}/logs/restart_${process_name}.log.`date +"%Y%m%d"`
}


. ${basedir}/restart_conf.sh

if [ "${mail_to}" = "" ]; then
  logger "Not set mail_to"
  exit 1
fi

process_name=$1
restart_command=$2

ps_count=`ps auxwww | grep ${process_name} | grep -v grep | grep -v ${basedir} | wc -l`

if [ ${ps_count} -eq 0 ]; then
  logger "Stopped ${process_name} process. Start restarting"
  eval ${restart_command}
  logger "End restarting"

  mail_body="restart ${process_name}. Please confirm your server."
  mail_subject="[Restart] ${process_name} on `hostname -s`"
  echo  ${mail_body} | mail -s ${mail_subject} "${mail_to}"

  logger "Send restart mail."
  logger "subject>>>> ${mail_subject}"
  logger "body>>> ${mail_body}"
  exit 1
fi

logger "Process remain..."
exit 0




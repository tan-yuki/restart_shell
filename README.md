restart_shell
=============

### How to install

<pre>
 mkdir /www/cron/
 cd /www/cron/
 git clone https://github.com/tan-yuki/restart_shell.git
</pre>

### Example of crontab
<pre>
* * * * * /www/cron/restart_shell/apache.sh
* * * * * /www/cron/restart_shell/mysqld.sh
</pre>



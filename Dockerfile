FROM local/c7-systemd
ENV container docker
RUN yum install -y --nogpgcheck httpd;\
yum install -y --nogpgcheck php;\

yum install mysql -y --nogpgcheck;\
yum remove mariadb -y --nogpgcheck;\
yum remove php-mysql -y --nogpgcheck;\
yum install php-mysqlnd -y --nogpgcheck;\
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm;\
yum install mysql-community-server -y --nogpgcheck;\
/usr/bin/systemctl enable mysqld;\
/usr/bin/systemctl start mysqld;\
/usr/bin/mysql_secure_installation;\
yum install phpMyAdmin -y --nogpgcheck;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
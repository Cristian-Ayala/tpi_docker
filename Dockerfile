FROM mariadb:10.5.2-bionic

EXPOSE 3306

ADD flota.sql /docker-entrypoint-initdb.d/flota.sql

ENV MYSQL_ROOT_PASSWORD=cristian MYSQL_DATABASE=flota MYSQL_PASSWORD=cristian

VOLUME /persist /var/lib/mysql

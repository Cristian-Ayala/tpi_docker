FROM mariadb:10.5.2-bionic

EXPOSE 3306

ADD https://raw.githubusercontent.com/Cristian-Ayala/tpi_docker/master/flota.sql /docker-entrypoint-initdb.d/flota.sql

ENV MYSQL_ROOT_PASSWORD=cristian MYSQL_DATABASE=flota MYSQL_PASSWORD=cristian

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

VOLUME /persist /var/lib/mysql

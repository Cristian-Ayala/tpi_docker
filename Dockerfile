FROM mariadb:10.5.2-bionic

EXPOSE 3306

ADD https://raw.githubusercontent.com/Cristian-Ayala/tpi_docker/master/flota.sql /docker-entrypoint-initdb.d/flota.sql

ENV MYSQL_ROOT_PASSWORD=cristian MYSQL_DATABASE=flota MYSQL_PASSWORD=cristian

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

VOLUME /persist /var/lib/mysql

LABEL maintainer="Cristian Ayala" \
    uesocc.edu.sv.tpi.image.title="Mariadb con bd inicializada" \
    uesocc.edu.sv.tpi.image.description="Al levantar el contenedor tambien se levanta la base de datos para ahorrar trabajo de importarla" \
    uesocc.edu.sv.tpi.image.vendor="MaridbDB" \
    uesocc.edu.sv.tpi.image.documentation="https://github.com/Cristian-Ayala/tpi_docker" \
    uesocc.edu.sv.tpi.image.url="https://github.com/Cristian-Ayala/tpi_docker/blob/master/Dockerfile" \
    uesocc.edu.sv.tpi.image.source="https://github.com/Cristian-Ayala/tpi_docker" \
    uesocc.edu.sv.tpi.image.created="30-Abril-2020"

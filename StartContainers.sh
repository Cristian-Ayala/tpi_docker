#!bin/bash

echo Deteneiendo MySQL Service

service mysqld stop

echo MariaDB local detenida

echo Iniciando contenedor de MariaDB

#Tag: Latest
docker build -t mariadb-bionic .

sleep 2s

#docker run -d --rm --name mariadbc -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -v /persist:/var/lib/mysql  --name mariadb-container -i mariadb-bionic 
docker run -d --rm --name mariadbc -p 3306:3306 -i mariadb-bionic

sleep 1s

echo Iniciando contenedor de PhpMyAdmin

sleep 2s 

docker run -d --rm --name phpmyadminc --link mariadbc -e PMA_HOST=mariadbc -p 8080:80 phpmyadmin/phpmyadmin:5.0

echo Iniciados con exito

sleep 2s

echo Abriendo PhpMyAdmin, por favor espere mientras se inicia la aplicación.

sleep 2s

#Cambiar usuario por el usuario normal
su -u cristian xdg-open http://localhost:8080/ > /dev/null 2>/dev/null


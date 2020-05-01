#!/bin/bash

echo Volcando los Datos...

#credenciales seteadas en el container de docker mariadbc
mysqldump -uroot -pcristian -h $(docker inspect --format '{{ .NetworkSettings.IPAddress }} ' mariadbc) flota > flota.sql

echo añadiendo los datos al repo

git add .

echo haciendo commit 

git commit -m $iteration

echo haciendo push

#ocupando variables de entorno 
git push https://$gitUser:"${gitPsw}"@github.com/$gitUser/$gitNameRepo.git master

export iteration=$(expr $iteration + 1)
 
echo  deteniendo contenedores

docker stop phpmyadminc mariadbc 
 
#Para eliminar todas als imagenes huarfanas porque se les ha robado el tag  
docker images -f dangling=true -q | xargs docker rmi 

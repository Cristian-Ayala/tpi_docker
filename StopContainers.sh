#!/bin/bash

echo Volcando los Datos...

#credenciales seteadas en el container de docker mariadbc
mysqldump -uroot -pcristian -h $(docker inspect --format '{{ .NetworkSettings.IPAddress }} ' mariadbc) flota > flota.sql

echo añadiendo los datos al repo

if [ -z "$gitUser" ] && [ -z "$gitPsw" ] && [ -z "$gitNameRepo" ] && [ -z "$iteration" ]; then
    echo "Falta definir alguna o todas las Variables de entorno"
else
    git fetch
    
    git pull
    
    git add Dockerfile flota.sql StartContainers.sh StopContainers.sh

    echo haciendo commit 

    git commit -m $iteration

    echo haciendo push

    #ocupando variables de entorno 
    git push https://$gitUser:"${gitPsw}"@github.com/$gitUser/$gitNameRepo.git master

    export iteration=$(expr $iteration + 1)
fi

echo  deteniendo contenedores

docker stop phpmyadminc mariadbc 
 
#Para eliminar todas als imagenes huarfanas porque se les ha robado el tag  
docker images -f dangling=true -q | xargs docker rmi 

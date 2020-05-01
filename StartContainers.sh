#!/bin/bash

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

#Progress Bar https://github.com/adriano-pinaffo/progressbar.sh

duration=120
barsize=$((`tput cols` - 7))
unity=$(($barsize / $duration))
increment=$(($barsize%$duration))
skip=$(($duration/($duration-$increment)))
curr_bar=0
prev_bar=
for (( elapsed=1; elapsed<=$duration; elapsed++ ))
do
  # Elapsed
  prev_bar=$curr_bar
  let curr_bar+=$unity
  [[ $increment -eq 0 ]] || {  
    [[ $skip -eq 1 ]] &&
      { [[ $(($elapsed%($duration/$increment))) -eq 0 ]] && let curr_bar++; } ||
	{ [[ $(($elapsed%$skip)) -ne 0 ]] && let curr_bar++; }
  }
  [[ $elapsed -eq 1 && $increment -eq 1 && $skip -ne 1 ]] && let curr_bar++
  [[ $(($barsize-$curr_bar)) -eq 1 ]] && let curr_bar++
  [[ $curr_bar -lt $barsize ]] || curr_bar=$barsize
  for (( filled=0; filled<=$curr_bar; filled++ )); do
    printf "▇"
  done

  # Remaining
  for (( remain=$curr_bar; remain<$barsize; remain++ )); do
    printf " "
  done

  # Percentage
  printf "| %s%%" $(( ($elapsed*100)/$duration))

  # Return
  sleep 1
  printf "\r"
done
printf "\n"

#Cambiar usuario por el usuario normal
sudo -u cristian xdg-open http://localhost:8080/ > /dev/null 2>/dev/null


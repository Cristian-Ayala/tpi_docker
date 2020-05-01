![TPI](https://user-images.githubusercontent.com/41448429/80761714-4d340a00-8af8-11ea-86eb-7ef20fceb19d.png)


> 4to. año de ingeniería de sistemas.

# ¡Bienvenido!

En este repositorio encontraras un proyecto para la materia de **TPI** del ciclo 7 de 10, de la carrera de ingeniería de sistemas informáticos. 

# Proyecto

Encontraras un **Dockerfile** que almacena las instrucciones para crear una imagen de mariadb, la cual trae una base de datos llamada **flota** al iniciar el contenedor, se han agregado 2 archivos con extensión .sh para que sólo se tengan que correr y ellos hagan todo el trabajo. (Se puede cambiar la base de datos por la que quiera, e incluso agregar más, si el usuario lo desea). Cuando los contenedores se detienen usando el StopContainers.sh, automáticamente se volcan los datos de la bd y se suben a git para tener un respaldo, los datos se actualizan y al volver a iniciar el contenedor los datos se le proporcionan al contenedor desde git.

## Pre-requisitos 

 1. Acceso a internet a la hora de correr los .Sh
 2. Haber descargado Docker y que esté corriendo
 3. Ocupar una distribuición linux o el bash. 
 4. Crear un repositorio para almacenar un respaldo de la bd.
 5. Crear las siguientes variables de entorno: gitUser (usuario de git), gitPsw (contraseña de la cuenta git), gitNameRepo (nombre del repositorio) e iteration (cuenta el número de veces que se ha hecho commit, y por lo tanto se le asigna al message del commit).

> Nota: Se pueden alojar las variables de manera global y persistentes en /etc/environment o sino hacer export nombre_env="valor_env"

## Iniciar los contenedores

Hay que cambiar algunas propiedades que dependen del usuario. Este .sh se puede correr en distribuciones **linux** porque se ha ocupado comandos del bash de **debian**. 

 1. Dar permisos de ejecución al sh.
 >EJ: chmod +x StartContainers.sh  
2. Correrlo como super usuario.
> $su (luego pedirá ingresar la contraseña)
3. Al final del archivo StartContainers.sh se encuentra una instrucción que requiere correrse con el usuario convencional de linux, en mi caso es "**cristian**" pero tiene que cambiarse por el de la persona que desea usarlo.
>sudo -u ${usuario_de_preferencia} ...
4. Ejecutar el script "**StartContainers**"
>#./StartContainers.sh

## Parar los contenedores.
 1. Dar permisos de ejecución al sh.
 >EJ: chmod +x StopContainers.sh 
2. Correrlo como super usuario.
> $su (luego pedirá ingresar la contraseña)
3. Ejecutar el script "**StopContainers**"
>#./StopContainers.sh



## Acerca de las versiones
Se ocupa MariaDB en su versión 10.5.2-bionic y PhpMyAdmin en su versión 5.0.

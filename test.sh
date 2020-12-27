#!/bin/bash

#Archivo de comandos a testear
COMANDOSF=/var/comandos.ini

#Comprueba que crudini está instalado
which crudini > /dev/null || exit 1

#Define el comando a ejecutar a partir de la pregunta (sección) pasada como argumento
COMANDO=$(crudini --get $COMANDOSF $1 comando)

#Ejecuta el comando
eval $COMANDO

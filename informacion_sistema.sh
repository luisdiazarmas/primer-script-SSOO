#!/bin/bash

# informacion_sistema - Un script que informa del estado del sistema

#### Constantes
TITLE="== Información del sistema $HOSTNAME =="
RIGHT_NOW=$(date +"%x %r%Z")
TIME_STAMP="Actualizada el $RIGHT_NOW por $USER"

#### Estilos
TEXT_BOLD=$'\x1b[1m'
TEXT_GREEN=$'\x1b[32m'
TEXT_RESET=$'\x1b[0m'
TEXT_UNLINE=$'\x1b[4m'

#### Funciones
system_info()
{
    echo "${TEXT_UNLINE}Tiempo encendido del sistema:${TEXT_RESET}"
    uptime
    echo
}

show_uptime()
{
    echo "${TEXT_UNLINE}Versión del sistema:${TEXT_RESET}"
    uname -a
    echo
}

drive_space()
{
    echo "${TEXT_UNLINE}Espacio en el disco disponible:${TEXT_RESET}"
    df -h
    echo
}

home_space()
{
    echo -e "${TEXT_UNLINE}USADO\tDIRECTORIO${TEXT_RESET}"
    if [[ $USER == "root" ]]; then
        echo "Ejecutado como sudo"
        du /home/* | sort -nr #| tr '/' ' ' | tr -s ' ' | cut -d ' ' -f 1,3
    else
        du -s "$HOME" #| sort -nr | tr '/' ' ' | tr -s ' ' | cut -d ' ' -f 1,3
    fi
}

#### Programa principal
cat << _EOF_
$TEXT_BOLD$TITLE$TEXT_RESET
$TEXT_GREEN$TIME_STAMP$TEXT_RESET

_EOF_
system_info
show_uptime
drive_space
home_space
exit 0

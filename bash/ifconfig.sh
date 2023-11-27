#!/bin/bash

# Script para obtener y mostrar direcciones IP de una máquina Linux

# Obtener información de interfaz de red utilizando ifconfig
ifconfig_output=$(ifconfig)

# Filtrar y mostrar direcciones IP utilizando awk
echo "Direcciones IP de la máquina:"
echo "$ifconfig_output" | awk '/inet / {print $2}'

# Obtener la dirección IP pública utilizando curl (requiere conexión a Internet)
public_ip=$(curl -s ifconfig.me)
echo "Dirección IP pública de la máquina: $public_ip"


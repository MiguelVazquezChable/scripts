#!/bin/bash

# Script que utiliza un bucle while y awk para procesar direcciones IP desde un archivo

archivo_ips="ips.txt"

# Verificar si el archivo existe
if [ ! -f "$archivo_ips" ]; then
    echo "El archivo de direcciones IP '$archivo_ips' no existe."
    exit 1
fi

# Inicializar variables
contador_ips=0

# Leer el archivo línea por línea utilizando un bucle while
while IFS= read -r ip; do
    # Verificar si la IP es válida utilizando awk
    if echo "$ip" | awk -F'.' '$1 <= 255 && $2 <= 255 && $3 <= 255 && $4 <= 255 {print "true"}'; then
        echo "IP válida: $ip"
        ((contador_ips++))
    else
        echo "Advertencia: IP no válida en la línea $contador_ips: $ip"
    fi
done < "$archivo_ips"

# Mostrar resumen
echo "Se encontraron $contador_ips direcciones IP válidas en el archivo."


#!/bin/bash

# Script que utiliza un bucle while y awk para procesar líneas de un archivo

archivo_datos="datos.txt"

# Verificar si el archivo existe
if [ ! -f "$archivo_datos" ]; then
    echo "El archivo de datos '$archivo_datos' no existe."
    exit 1
fi

# Inicializar contador
contador=1

# Leer el archivo línea por línea utilizando un bucle while
while IFS= read -r linea; do
    # Procesar cada línea utilizando awk
    resultado=$(echo "$linea" | awk '{print $1}')  # Ejemplo: Obtener el primer campo de cada línea
    echo "Línea $contador: $resultado"
    
    # Incrementar el contador
    ((contador++))
done < "$archivo_datos"


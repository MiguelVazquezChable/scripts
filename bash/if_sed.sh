#!/bin/bash

# Script que utiliza un if con sed para modificar un archivo

archivo_original="archivo.txt"
archivo_backup="archivo_backup.txt"

# Verificar si el archivo original existe
if [ ! -f "$archivo_original" ]; then
    echo "El archivo original '$archivo_original' no existe."
    exit 1
fi

# Hacer una copia de seguridad del archivo original
cp "$archivo_original" "$archivo_backup"

# Realizar una modificación en el archivo original utilizando sed
sed -i 's/old_pattern/new_pattern/' "$archivo_original"

# Verificar si la modificación fue exitosa
if [ $? -eq 0 ]; then
    echo "Modificación exitosa. Se ha creado una copia de seguridad en '$archivo_backup'."
else
    echo "Error al realizar la modificación."
    # Restaurar el archivo original desde la copia de seguridad en caso de error
    cp "$archivo_backup" "$archivo_original"
fi


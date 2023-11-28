#!/bin/bash

# Verificar si el script se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root."
  exit 1
fi

# Verificar si se proporciona un nombre de usuario como argumento
if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un nombre de usuario como argumento."
  exit 1
fi

# Obtener el nombre completo del usuario del primer argumento
FULLNAME=$1
# Separar el nombre y apellido
IFS=' ' read -r -a NAME_PARTS <<< "$FULLNAME"
FIRST_NAME=${NAME_PARTS[0]}
LAST_NAME=${NAME_PARTS[1]}

# Crear el usuario
useradd -m -s /bin/bash -c "$FULLNAME" "$FIRST_NAME"

# Establecer una contraseña para el nuevo usuario
echo "Por favor, establece una contraseña para el usuario $FIRST_NAME:"
passwd "$FIRST_NAME"

# Añadir el nuevo usuario al grupo sudo (si se desea)
# usermod -aG sudo "$FIRST_NAME"

echo "Usuario $FIRST_NAME creado exitosamente."


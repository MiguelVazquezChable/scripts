#!/bin/bash

# Verifica si se proporciona un nombre de usuario como argumento
if [ "$#" -eq 0 ]; then
  echo "Por favor, proporciona un nombre de usuario."
  exit 1
fi

# Nombre de usuario proporcionado como argumento
usuario="$1"

# Verifica si el usuario existe
if id "$usuario" &>/dev/null; then
  echo "Información del usuario $usuario:"
  echo "-------------------------------------"
  
  # Información del usuario
  id "$usuario"
  
  # Directorio de inicio del usuario
  echo -e "\nDirectorio de inicio:"
  grep "^$usuario:" /etc/passwd | cut -d: -f6

  # Último inicio de sesión
  echo -e "\nÚltimo inicio de sesión:"
  lastlog -u "$usuario"

  # Pertenencia a grupos
  echo -e "\nGrupos a los que pertenece:"
  groups "$usuario"

  echo "-------------------------------------"
else
  echo "El usuario $usuario no existe."
  exit 1
fi

exit 0


#!/bin/bash

# Verifica si el script se ejecuta como superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Este script debe ejecutarse como superusuario."
  exit 1
fi

# Verifica si se proporcionan nombres de usuario como argumentos
if [ "$#" -eq 0 ]; then
  echo "Por favor, proporciona al menos un nombre de usuario."
  exit 1
fi

# Recorre la lista de nombres de usuario proporcionados
for username in "$@"; do
  # Obtiene el shell del usuario
  user_shell=$(getent passwd "$username" | cut -d: -f7)

  # Verifica si el shell es /bin/bash
  if [ "$user_shell" = "/bin/bash" ]; then
    # Elimina al usuario
    userdel -r "$username"
    echo "Usuario $username eliminado."
  else
    echo "El usuario $username no tiene /bin/bash como shell."
  fi
done

exit 0

sudo cat /etc/passwd



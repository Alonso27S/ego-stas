#!/bin/bash

# Ruta del directorio de Apache (ajusta según tu configuración)
DIRECTORIO_APACHE="/var/www/html"  # ← Cambia esto si tu Apache usa otra ruta

# Ruta de destino para el respaldo
CARPETA_DESTINO="/home/asuarez/backup-decifrado"  # ← Ajusta esta ruta

# Nombre del archivo de respaldo (con fecha)
ARCHIVO_RESPALDO="respaldo-apache_$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"

# Verificar si el directorio de Apache existe
if [ ! -d "$DIRECTORIO_APACHE" ]; then
  echo "Error: El directorio de Apache '$DIRECTORIO_APACHE' no existe."
  exit 1
fi

# Crear carpeta de destino si no existe
mkdir -p "$CARPETA_DESTINO"

# Crear respaldo comprimido (tar.gz)
tar -czvf "$CARPETA_DESTINO/$ARCHIVO_RESPALDO" "$DIRECTORIO_APACHE"

# Verificar éxito
if [ $? -eq 0 ]; then
  echo "Respaldo de Apache completado: $CARPETA_DESTINO/$ARCHIVO_RESPALDO"
else
  echo "Error al crear el respaldo."
  exit 1
fi

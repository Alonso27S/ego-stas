#!/bin/bash

# Directorio que deseas respaldar
ORIGEN="/home/asuarez/backup-documentos"

# Carpeta donde guardarás el respaldo
DESTINO="/home/asuarez/backup-documentos"

# Nombre del archivo con fecha
FECHA=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVO="respaldo_$FECHA.tar.gz"

# Crear respaldo
tar -czvf "$DESTINO/$ARCHIVO" "$ORIGEN"

# Mensaje de éxito
echo "Respaldo creado exitosamente: $DESTINO/$ARCHIVO"

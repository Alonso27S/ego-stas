#!/bin/bash
# Creado por Juan Reynoso Elias 18-06-2025
# Última modificación: 18-06-2025

# Configuración
db_user="AlonsoW"
db_password="AlonsoWendy"
db_name="egoistas"
backup_dir="$HOME/backup-documentos"

# Crear directorio si no existe
mkdir -p "$backup_dir"

# Fecha con formato seguro para nombres de archivo
backup_date=$(date +"%Y-%m-%d-%H-%M-%S")

# Nombre del archivo de respaldo (usando guiones normales)
backup_file="$backup_dir/${db_name}-${backup_date}.sql"

# Realizar el respaldo
if mysqldump -u"$db_user" -p"$db_password" "$db_name" > "$backup_file"; then
    # Generar checksum (en el mismo directorio de backups)
    md5sum "$backup_file" > "$backup_file.md5"
    echo "Respaldo de $db_name completado: $backup_file"
else
    echo "Error al hacer el respaldo de $db_name"
    exit 1
fi



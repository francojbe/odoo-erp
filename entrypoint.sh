#!/bin/bash
set -e

# Define configuration file location
ODOO_RC="/app/odoo.conf"

# Only generate config if we have DB_HOST environment variable (typical in Easypanel)
if [ -n "$DB_HOST" ]; then
    echo "Generating odoo.conf from environment variables..."
    echo "[options]" > "$ODOO_RC"
    echo "admin_passwd = ${ADMIN_PASSWORD:-admin}" >> "$ODOO_RC"
    echo "db_host = ${DB_HOST}" >> "$ODOO_RC"
    echo "db_port = ${DB_PORT:-5432}" >> "$ODOO_RC"
    echo "db_user = ${DB_USER}" >> "$ODOO_RC"
    echo "db_password = ${DB_PASSWORD}" >> "$ODOO_RC"
    
    if [ -n "$DB_NAME" ]; then
        echo "db_name = ${DB_NAME}" >> "$ODOO_RC"
    fi
    
    # Addons path: include the default addons directory
    echo "addons_path = /app/odoo/addons" >> "$ODOO_RC"
    
    # Set data directory for persistent storage (filestore, sessions)
    echo "data_dir = /var/lib/odoo" >> "$ODOO_RC"
    
    # Listing on 0.0.0.0 is crucial for Docker
    echo "http_interface = 0.0.0.0" >> "$ODOO_RC"
    echo "http_port = 8069" >> "$ODOO_RC"
fi

# Ensure the data directory exists
mkdir -p /var/lib/odoo

# Proceed with the command provided (e.g., executing Odoo)
exec "$@"

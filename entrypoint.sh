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
    # db_password is passed via command line to avoid issues with special characters (like #) in config file
    
    if [ -n "$DB_NAME" ]; then
        echo "db_name = ${DB_NAME}" >> "$ODOO_RC"
    fi
    
    # Addons path: include the default addons directory and extra_addons for custom modules
    echo "addons_path = /app/extra_addons,/app/odoo/addons" >> "$ODOO_RC"
    
    # Set data directory for persistent storage (filestore, sessions)
    echo "data_dir = /var/lib/odoo" >> "$ODOO_RC"
    
    # Listing on 0.0.0.0 is crucial for Docker
    echo "http_interface = 0.0.0.0" >> "$ODOO_RC"
    echo "http_port = 8069" >> "$ODOO_RC"
fi

# Ensure the data directory exists
mkdir -p /var/lib/odoo

# Proceed with the command provided (e.g., executing Odoo)
if [ -n "$DB_PASSWORD" ]; then
    # Odoo/psycopg2 will automatically use this environment variable
    export PGPASSWORD="${DB_PASSWORD}"
fi

exec "$@"

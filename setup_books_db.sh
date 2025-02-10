#!/bin/bash

# Database configurations
DB_NAME="bookstore_db"
DB_ADMIN="postgres"
DB_ADMIN_PASS="admin"
VIEW_USER="view_user"
VIEW_USER_PASS="ViewOnlyPass123"
DB_HOST="localhost"
DB_PORT="5433"  # Change if necessary
SQL_DIR="./sql"

# Function to handle errors
handle_error() {
    echo "Error occurred during execution. Exiting."
    exit 1
}

# Trap errors
trap 'handle_error' ERR

echo "Starting database setup on port $DB_PORT..."

# Create the database
echo "Creating database..."
psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -f "$SQL_DIR/01_create_db.sql"

# Execute SQL scripts in order
for sql_file in 02_create_tables.sql 03_create_roles.sql 04_create_functions.sql 05_create_views.sql 06_insert_data.sql
do
    echo "Executing $sql_file..."
    PGPASSWORD=$DB_ADMIN_PASS psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_ADMIN" -d "$DB_NAME" -f "$SQL_DIR/$sql_file"
done

echo " Database setup completed successfully."
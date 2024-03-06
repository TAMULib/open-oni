#!/bin/bash

# Get database information.
read -p "Enter the database name: " DATABASE_NAME
read -p "Enter the database host: " DATABASE_HOST
read -p "Enter the database user: " DATABASE_USER
read -s -p "Enter password: " DATABASE_PASSWORD
read -p "Enter site url: [e.g. newspaper.mydomain.com] " SITE_URL
echo

# Run SQL commands:
mysql -h "${DATABASE_HOST}" -u "${DATABASE_USER}" -p"${DATABASE_PASSWORD}" "${DATABASE_NAME}" < "initialize_database_tamu.sql"

# Check the exit status of the mysql command
if [ $? -eq 0 ]; then
    echo "Data inserted successfully."
    echo
else
    echo "Error: Failed to insert data into the database."
    echo
fi
#!/bin/bash

# Get database information.
read -p "Enter the database name: " DATABASE_NAME
read -p "Enter the database host: " DATABASE_HOST
read -p "Enter the database user: " DATABASE_USER
read -s -p "Enter password: " DATABASE_PASSWORD
echo
read -p "Enter site url: [e.g. newspaper.mydomain.com] " SITE_URL
echo

# Load SQL content:
SQL_CONTENT=$(<update_database_tamu.sql)
SQL_CONTENT="${SQL_CONTENT//SITE_URL/${SITE_URL}}"

# Inject SQL content:
echo "${SQL_CONTENT}" | mysql -h "${DATABASE_HOST}" -u "${DATABASE_USER}" -p"${DATABASE_PASSWORD}" "${DATABASE_NAME}"

# Check the exit status of the mysql command
if [ $? -eq 0 ]; then
    echo "Data updated successfully."
    echo
else
    echo "Error: Failed to update data into the database."
    echo
fi
#!/bin/bash

# Get database information.
read -p "Enter the database name: " DATABASE_NAME
read -p "Enter the database host: " DATABASE_HOST
read -p "Enter the database user: " DATABASE_USER
read -s -p "Enter password: " DATABASE_PASSWORD
echo
read -p "Enter site url: [e.g. newspaper.mydomain.com] " SITE_URL
echo

# Load SQL content
SQL_CONTENT=$(<initialize_database_tamu.sql)
SQL_CONTENT="${SQL_CONTENT//SITE_URL/${SITE_URL}}"

# Run SQL commands:
echo "${SQL_CONTENT}" | mysql -h "${DATABASE_HOST}" -u "${DATABASE_USER}" -p"${DATABASE_PASSWORD}" "${DATABASE_NAME}"

# Check the exit status of the mysql command
if [ $? -eq 0 ]; then
    echo "Data inserted successfully."
    echo
else
    echo "Error: Failed to insert data into the database."
    echo
fi
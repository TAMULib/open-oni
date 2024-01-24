#!/bin/bash

OPENONI_SOURCE_DIR="/opt/openoni_source"
OPENONI_INSTALL_DIR="/opt/openoni/app"
OPENONI_COPY_FILES_SCRIPT_FILENAME="manager_copy_openoni_files.sh"

echo
echo "Current file contents in ${OPENONI_INSTALL_DIR} ..."
echo

ls -al ${OPENONI_INSTALL_DIR}
echo

echo "\"manager\" service started..."
echo "Run \"${OPENONI_SOURCE_DIR}/${OPENONI_COPY_FILES_SCRIPT_FILENAME}\" to copy files from \"${OPENONI_SOURCE_DIR}\" to \"${OPENONI_INSTALL_DIR}\"."
echo
echo "[INFO] - Open ONI files have to be copied into \"${OPENONI_INSTALL_DIR}\" before the \"web\" can successfully start."

exec "$@"
tail -f /dev/null
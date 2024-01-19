#!/bin/bash

OPENONI_SOURCE_DIR="/opt/openoni_source"
OPENONI_INSTALL_DIR="/opt/openoni/app"

echo
echo "Current file contents in ${OPENONI_INSTALL_DIR} ..."
echo

ls -al ${OPENONI_INSTALL_DIR}
echo

echo "\"manager\" service started..."
echo "Run \"${OPENONI_INSTALL_DIR}/manager_openoni_files.sh\" to copy files from \"${OPENONI_SOURCE_DIR}\" to \"${OPENONI_INSTALL_DIR}\"."
echo
echo "[INFO] - Open ONI files have to be copied into \"${OPENONI_INSTALL_DIR}\" before the \"web\" can successfully start."

exec "$@"
tail -f /dev/null
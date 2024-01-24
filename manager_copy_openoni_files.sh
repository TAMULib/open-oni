#!/bin/bash

OPENONI_SOURCE_DIR="/opt/openoni_source"
OPENONI_INSTALL_DIR="/opt/openoni/app"

echo "Current contents in ${OPENONI_INSTALL_DIR} ... "
ls -al ${OPENONI_INSTALL_DIR}
echo

read -p "[WARNING] - Contents in \"${OPENONI_INSTALL_DIR}\" will be deleted. Press Enter to continue ..."
echo "Files in \"${OPENONI_INSTALL_DIR}\" are being deleted, please wait ... "
rm -rf ${OPENONI_INSTALL_DIR}

echo "\"${OPENONI_INSTALL_DIR}\" deleted ..."
echo

echo "Begin copying files ..."
mkdir ${OPENONI_INSTALL_DIR}
cp -af ${OPENONI_SOURCE_DIR}/* ${OPENONI_INSTALL_DIR}
echo "Files copied from ${OPENONI_SOURCE_DIR} to ${OPENONI_INSTALL_DIR}"

echo
ls -al ${OPENONI_INSTALL_DIR}
echo

echo "Successfully copied Open ONI files. The \"web\" service can be started."
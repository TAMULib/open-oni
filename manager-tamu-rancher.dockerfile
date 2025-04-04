FROM alpine:3.21.3

# Define directory paths.
ENV OPENONI_SOURCE_DIR="/opt/openoni_source"
ENV OPENONI_INSTALL_DIR="/opt/openoni"
ENV ENTRYPOINT_FILENAME="manager-entrypoint-tamu-rancher.sh"
ENV ENTRYPOINT_SCRIPT_PATH="${OPENONI_SOURCE_DIR}/${ENTRYPOINT_FILENAME}"

# Basic system ENVs:
ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
ENV TZ="America/Chicago"

RUN apk update && apk upgrade && \
    apk add --no-cache musl-locales musl-locales-lang tzdata ca-certificates && \
    apk add --no-cache git nano curl unzip mysql-client bash && \
    update-ca-certificates

# Copy files to /opt/openoni_source
COPY . ${OPENONI_SOURCE_DIR}
WORKDIR ${OPENONI_SOURCE_DIR}

RUN chmod +x ${OPENONI_SOURCE_DIR}/web-entrypoint.sh && \
    chmod +x ${ENTRYPOINT_SCRIPT_PATH} && \
    chmod +x ${OPENONI_SOURCE_DIR}/batch_load_batches.sh && \
    chmod +x ${OPENONI_SOURCE_DIR}/compile_themes.sh && \
    chmod +x ${OPENONI_SOURCE_DIR}/manager_copy_openoni_files.sh && \
    chmod -R 777 ${OPENONI_SOURCE_DIR}/data/

WORKDIR ${OPENONI_INSTALL_DIR}

ENTRYPOINT ${ENTRYPOINT_SCRIPT_PATH}


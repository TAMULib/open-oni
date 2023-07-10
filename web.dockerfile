FROM ubuntu:focal

ARG OPENONI_INSTALL_DIR="/opt/openoni_install"
ARG OPENONI_DIR="/opt/openoni"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install locales && \
    ln -fs /usr/share/zoneinfo/US/Central /etc/localtime && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get -y install --no-install-recommends \
    apache2 ca-certificates gcc git libmysqlclient-dev \
    libssl-dev libxml2-dev libxslt-dev libjpeg-dev \
    mysql-client curl rsync python3-dev python3-venv nano acl && \
    apt-get -y install --no-install-recommends libapache2-mod-wsgi-py3

RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log && \
    a2enmod cache cache_disk expires rewrite proxy_http ssl && \
    mkdir -p /var/cache/httpd/mod_disk_cache && \
    chown -R www-data:www-data /var/cache/httpd && \
    a2dissite 000-default.conf && \
    rm /bin/sh && ln -s /bin/bash /bin/sh && \
    mkdir /opt/openoni

COPY . ${OPENONI_INSTALL_DIR}
WORKDIR ${OPENONI_INSTALL_DIR}

RUN chmod u+x ${OPENONI_INSTALL_DIR}/entrypoint.sh && \
    chmod u+x ${OPENONI_INSTALL_DIR}/load_tamu_batches.sh && \
    echo "/usr/local/bin/manage delete_cache" > /etc/cron.daily/delete_cache && \
    chmod u+x /etc/cron.daily/delete_cache

WORKDIR ${OPENONI_DIR}

EXPOSE 80
ENTRYPOINT ["/opt/openoni_install/entrypoint.sh"]
FROM mysql:5.7
MAINTAINER Hypothes.is Project and contributors

RUN apt-get update && \
    apt install -y --no-install-recommends python python-pip && \
    pip install -U pip awscli && \
    rm -rf /var/lib/apt/lists/*

RUN chown backup:backup /var/backups

ADD mysql-s3-backup /usr/local/bin

USER backup
WORKDIR /var/backups
CMD mysql-s3-backup

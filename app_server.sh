#!/usr/bin/env bash

exec  gunicorn --bind=0.0.0.0:80 config.wsgi \
        --settings=config.settings.base\
        --log-level=info \
        --log-syslog \
        --log-syslog-to=udp://loggy:514 \
        --log-file=-\
        --access-logfile=-\
        --error-logfile=-
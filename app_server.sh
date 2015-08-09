#!/usr/bin/env bash

exec  gunicorn --bind=0.0.0.0:80 django_docker_sample.wsgi \
        --settings=django_docker_sample.settings\
        --log-level=info \
        --log-syslog \
        --log-syslog-to=cloudwatchlogs \
        --log-syslog-to=udp://cloudwatchlogs:514
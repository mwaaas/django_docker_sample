#!/usr/bin/env bash

exec python manage.py runserver 0.0.0.0:80  --settings=django_docker_sample.settings


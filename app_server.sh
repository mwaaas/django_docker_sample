#!/usr/bin/env bash
python manage.py migrate --noinput --settings=$DJANGO_SETTINGS_MODULE

python manage.py collectstatic --noinput

python manage.py initadmin --username=admin --password=yz2rsMcaj3UJ3daRswBd --settings=$DJANGO_SETTINGS_MODULE

exec  gunicorn --bind=0.0.0.0:3000 config.wsgi \
        --settings=config.settings.base\
        --log-level=info \
        --log-syslog \
        --log-syslog-to=udp://loggy:514 \
        --log-file=-\
        --access-logfile=-\
        --error-logfile=- \
        --reload
#!/bin/sh
set -e
python app/manage.py makemigrations
python app/manage.py migrate
python app/manage.py collectstatic --no-input
python app/manage.py createdefaultuser
sh -c 'cd /service/app/ && gunicorn --workers 5 --timeout 60 --bind 0.0.0.0:8000 conf.wsgi:application'
exec "$@"
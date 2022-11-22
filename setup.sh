#!/bin/sh
set -e
python app/manage.py makemigrations
python app/manage.py migrate
python app/manage.py collectstatic --no-input
python app/manage.py createsuperuser --no-input
exec "$@"
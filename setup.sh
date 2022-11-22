#!/usr/bin/bash

python app/manage.py makemigrations
python app/manage.py migrate
python app/manage.py createsuperuser --no-input
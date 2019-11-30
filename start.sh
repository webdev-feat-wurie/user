#!/bin/sh
python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

exec gunicorn user.wsgi:application --bind 0.0.0.0:21700 --reload

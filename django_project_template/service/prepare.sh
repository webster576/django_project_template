#!/bin/bash

# previos django settings
cd /var/www/
django-admin startproject {project_name}

mkdir /var/www/{project_name}/{project_name}/media && chown www-data /var/www/{project_name}/{project_name}/media
mkdir /var/www/{project_name}/{project_name}/static && chown www-data /var/www/{project_name}/{project_name}/static

sed -i '12 a import os' /var/www/{project_name}/{project_name}/settings.py && \
sed -i '118 a STATIC_ROOT = os.path.join(BASE_DIR, "static/")' /var/www/{project_name}/{project_name}/settings.py

#cd faleristics
#python3 manage.py collectstatic


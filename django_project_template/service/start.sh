#!/bin/bash

if [ -d /var/www/{project_name} ]
then
	inotifywait -m -e close_write /var/www/{project_name}/*/*.py /var/www/{project_name}/*/*/*.py | while read file;
	do
	  echo "--- nginx and uwsgi restarted ---"
	  service nginx restart && uwsgi --reload /var/www/{project_name}/uwsgi.pid
	done &

	echo "--- nginx and uwsgi started ---"
	service nginx start && uwsgi --ini /home/ubuntu/uwsgi.ini
else
    uwsgi --http :80 --wsgi-file /home/ubuntu/placeholder.py
fi

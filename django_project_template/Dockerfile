FROM ubuntu:23.04

ENV DEBIAN_FRONTEND "noninteractive"
ENV TZ "Europe/Prague"

RUN apt update && \
    apt install -y apt-utils mc nano inotify-tools nginx \
    gcc libc-dev libpq5 postgresql-client-common \
    build-essential tzdata python3 python3-dev python3-pip python3-setuptools && \
    apt clean
    
COPY service/requirements.txt /home/ubuntu/
RUN pip3 install --no-cache-dir -r /home/ubuntu/requirements.txt

COPY service/project.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/project.conf /etc/nginx/sites-enabled/

COPY service/prepare.sh /home/ubuntu
RUN chmod +x /home/ubuntu/prepare.sh

COPY service/start.sh /home/ubuntu
RUN chmod +x /home/ubuntu/start.sh

COPY service/uwsgi.ini /home/ubuntu/
COPY service/placeholder.py /home/ubuntu/
WORKDIR /var/www


#!/bin/bash
echo Please enter new project name:
read project_name


### copying files for new project ###
mkdir -p $project_name/www
mkdir -p $project_name/service

cp django_project_template/docker-compose.yml $project_name/docker-compose.yml
cp django_project_template/Dockerfile $project_name/Dockerfile

service_files=("placeholder.py" "prepare.sh" "project.conf" "requirements.txt" "start.sh" "uwsgi.ini")
for s_file in ${service_files[@]};
do
    cp django_project_template/service/$s_file $project_name/service/$s_file
done
unset service_files


### changing new project files according to selected name ###
declare -a projectFiles=("$project_name/docker-compose.yml" "$project_name/service/prepare.sh" "$project_name/service/project.conf" "$project_name/service/start.sh" "$project_name/service/uwsgi.ini")

for pr_file in ${projectFiles[@]};
do
    sed -i "s/{project_name}/$project_name/g" $pr_file
done
unset projectFiles


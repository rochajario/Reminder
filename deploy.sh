#!/bin/bash

# ~ Important Information

#Required Parameters:
# -h Database Host
# -u Database User
# -p Database Password
# -t Telegram Key
# -r RabbitMQ User
# -m RabbitMQ Password

getRandomJwtSecret()
{
    jwt_secret=`cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-100} | head -n 1`
}

getRandomJwtSecret
while getopts u:p:h:t:r:m flag
do
    case "${flag}" in
        u) db_user=${OPTARG};;
        p) db_password=${OPTARG};;
        h) db_host=${OPTARG};;
        t) telegram_key=${OPTARG};;
        r) rabbit_config=${OPTARG};;
    esac
done

echo "Entering Dist Folder..."
echo $PWD;
echo;

echo "Defining Environment Variables..."
echo JWT_KEY=$jwt_secret > .env
echo DB_HOST=$db_host >> .env
echo DB_USER=$db_user >> .env
echo DB_PASSWORD=$db_password >> .env
echo TELEGRAM_KEY=$telegram_key >> .env
echo RABBITMQ_USER=$rabbit_config >> .env
echo RABBITMQ_PASSWORD=$rabbit_config >> .env

echo "Renewing Docker Compose Workload..."
docker stop $(docker ps -a -q)
docker images -a | grep "^remindme*" | awk '{print $3}' | xargs docker rmi -f
docker compose -f compose.yml down
docker compose -f compose.yml --env-file .env up --detach
exit 0
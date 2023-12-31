# Reminder - Microservices Experiment

This Application was built as a Microservices experiment in order to validate and experience the trade-offs of decision making related to the architecture and organization of each project.

The main objective was to develop skills that would allow me to better understand the architectural implications of different approaches when dealing with distributed systems.

<div align=center>
    <img src="./Docs/architecture_overview.png" alt="Microsservices Diagram"/>
</div>


## Environment Variables

To run this project, you will need to add the following environment variables to your `.env` file

| Parameter | Description | Purpose |
| :-------- | :---------- | :------ |
| `DB_HOST` | Database Address    | Hostname or IP Address to connect to the database |
| `DB_USER` | Database Connection   | Database Connection Parameter |
| `DB_PASSWORD` | Database Connection   | Database Connection Parameter |
| `RABBITMQ_USER` | RabbitMQ User   | User that will be used as container variable |
| `RABBITMQ_PASSWORD` | RabbitMQ User   | Password that will be used as container variable |
| `JWT_KEY` | Random Value Key | It should be consistent within the other complementary projects |

You can use the following `.env` suggested file format
```config
DB_HOST=
DB_USER=
DB_PASSWORD=
RABBITMQ_USER=
RABBITMQ_PASSWORD=
JWT_KEY=
TELEGRAM_KEY=
```

## Deploy

In order to run the project locally must have a container daemon such as Docker or Podman installed and then run the following command

### Running Manually:
Start Services
```bash
 docker compose -f compose.yml --env-file .env up
```
Stop Services
```bash
docker compose down
```

### Using Deploy Script:
By using the deploy script the `.env` file will be automatically set and the docker images will be renewed (if previously created) or created.
```bash
./deploy.sh -u <database_user> -p <database_password> -h <database_host> -t <telegram_key> -r <rabbitmq_user>
```



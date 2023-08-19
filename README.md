# laravel-flask-node-docker
This Project consists of single docker-compose (which consists of all databases [postgress-mysql-mongo-redis])

There are layered databases in compose file and running on default port but on "custom_network"

And there is a single container which is running the laravel + flask + nodejs
Laravel is using postgress
Flask is using mysql
Nodejs using mongodb

Docker file is build using this command
"docker build -t app-image ."
And creating the container and running using this command
"docker run -d --network mynetwork -p 81:81 -p 80:80 -p 82:82 -p 83:83 --name app-container app-image"

and then hitting the ports
localhost:80 (this will show the laravel connection with postgres and redis)
localhost:81 (this will show the flask connection with mysql)
localhost:82 (this will show the nodejs connection with mongodb)


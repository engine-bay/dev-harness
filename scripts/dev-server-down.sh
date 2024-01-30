#!/bin/bash

cd ..

docker compose --file docker-compose.dev.yaml down

docker rmi engine-bay-community-edition:latest

docker rmi engine-bay-demo-api:latest
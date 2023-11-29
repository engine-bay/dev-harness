#!/bin/bash

cd ..

docker compose down

docker rmi engine-bay-community-edition:latest

docker rmi engine-bay-demo-api:latest
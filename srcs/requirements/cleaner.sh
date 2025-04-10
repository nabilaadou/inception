#!/bin/bash

sudo docker kill $(sudo docker ps -q)

sudo docker rmi -f $(sudo docker images -q)

sudo docker volume prune -f
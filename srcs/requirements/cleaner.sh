#!/bin/bash

sudo docker compose down -v

sudo docker kill $(sudo docker ps -q)

sudo docker rmi -f $(sudo docker images -q)

sudo docker volume prune -f

sudo rm -rf $HOME/data/ws/*
sudo rm -rf $HOME/data/db/*
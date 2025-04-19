#!/bin/bash

#redis is binded by default to 127.0.0.1. and that tells redis to accept incoming connection from within this container

echo "maxmemory 128mb\nmaxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
#settin a limit for how much ram redis can use
#and what to remove when the memory is full

redis-server --protected-mode no
#the reason i have protected mode disabled is because i am listening to all ports
#and redis if in protected mode might refuse that
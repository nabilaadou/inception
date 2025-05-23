all:
	sudo docker compose -f srcs/docker-compose.yml up -d --build
dir:
	sudo mkdir -p /home/naadou/data/ws
	sudo mkdir -p /home/naadou/data/db

re: clean all

clean:
	sudo docker compose -f srcs/docker-compose.yml down -v
	sudo docker kill $$(sudo docker ps -q) || true
	sudo docker rmi -f $$(sudo docker images -q) || true
	sudo docker volume prune -f
	sudo rm -rf /home/naadou/data/ws/*
	sudo rm -rf /home/naadou/data/db/*
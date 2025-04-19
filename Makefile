all:
	sudo docker compose -f srcs/docker-compose.yml up --build
clean:
	sudo docker compose -f srcs/docker-compose.yml down -v
	sudo docker kill $$(sudo docker ps -q) || true
	sudo docker rmi -f $$(sudo docker images -q) || true
	sudo docker volume prune -f
	sudo rm -rf $$HOME/data/ws/*
	sudo rm -rf $$HOME/data/db/*
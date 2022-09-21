CONTAINER = dev-container
CONTAINER_ID := $$(docker ps | grep $(CONTAINER) | cut -d' ' -f1)

code: 
	docker exec -it $(CONTAINER_ID) tmux

start: 
	docker-compose up -d

build:
	docker build -t $(CONTAINER) .

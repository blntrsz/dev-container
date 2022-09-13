CONTAINER = dev-container

run: 
	docker run -it $(CONTAINER) zsh

build:
	docker build -t $(CONTAINER) .
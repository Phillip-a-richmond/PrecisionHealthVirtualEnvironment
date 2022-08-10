DOCKERHUB_USERNAME=singha53
IMAGE_VERSION=v0.1

# Docker 	
build:
	docker build -t $(DOCKERHUB_USERNAME)/rpystudio:$(IMAGE_VERSION) .

run:
	docker run --rm -it -p 8787:8787 -e PASSWORD=123 -v $(shell pwd):/home/rstudio/ $(DOCKERHUB_USERNAME)/rpystudio:$(IMAGE_VERSION)
	
push:
	docker push $(DOCKERHUB_USERNAME)/rpystudio:$(IMAGE_VERSION)
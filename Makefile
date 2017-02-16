DOCKER_TAG = latest

.PHONY: default
default: build

.PHONY: build
build:
	docker build -t hypothesis/mysql-s3-backup:$(DOCKER_TAG) .

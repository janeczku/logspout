NAME=janeczku/logspout-logstash
VERSION=$(shell cat VERSION)

.PHONY: release build

build:
	docker build -t $(NAME):$(VERSION) .

release:
	docker push $(NAME):$(VERSION)

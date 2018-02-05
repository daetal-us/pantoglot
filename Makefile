.PHONY: build test latest push release

NAME = pantoglot/alpine
WD = $(shell pwd)

build:
	docker build -t ${NAME}:dev .

test: build
	docker run -it ${NAME}:dev

latest:
	docker build -t ${NAME}:latest .

push: latest
	docker push ${NAME}:latest

release:
	rake build && rake release

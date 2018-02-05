.PHONY: test build

NAME = pantoglot
SRC=$(pwd)/lib

build:
	docker build -t ${NAME}:dev .

test: build
	docker run -v ${SRC}:/stage -it ${NAME}:dev

test-file:
	docker run -v ${SRC}:/stage -it ${NAME}:dev README.md

latest:
	docker build -t ${NAME}:latest

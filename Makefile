.PHONY: test build

NAME = pantoglot
WD = $(shell pwd)

build:
	docker build -t ${NAME}:dev .

test: build
	docker run -it ${NAME}:dev

test-repo: build
	docker run -v ${WD}:/stage -it ${NAME}:dev .

test-file: build
	docker run -v ${WD}:/stage -it ${NAME}:dev README.md

latest:
	docker build -t ${NAME}:latest .

release:
	rake build && rake release

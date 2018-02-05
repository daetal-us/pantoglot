.PHONY: clean build test latest push release link

NAME = pantoglot/alpine
WD = $(shell pwd)

clean:
	rm /usr/local/bin/docker-pantoglot

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

link:
	ln -s ${WD}/bin/docker-pantoglot /usr/local/bin/docker-pantoglot

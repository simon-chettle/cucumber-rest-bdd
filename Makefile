TAG := graze/cucumber-rest-bdd
RUN := docker run --rm -it -v $(PWD):/opt/src -w /opt/src ${TAG}

build:
	docker-compose build runner

test: start-test-server
	docker-compose run --rm runner cucumber --order random
	make stop-test-server

start-test-server: stop-test-server
	docker-compose up -d test-server

stop-test-server:
	docker-compose stop test-server
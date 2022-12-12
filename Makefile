pull.submodules:
	@git submodules update --init --recursive

install:
	@cd frontend; npm i; cd -
	@cd backend; npm i; cd -

stop.db:
	@docker stop mongo-db; docker rm mongo-db;

run.db: stop.db
	@docker run -d  --name mongo-db -p 27017:27017 mongo

run.frontend:
	@cd frontend; npm start; cd -

run.backend:
	@cd backend; npm start; cd -

run.full: run.frontend run.backend

run.all: run.db run.full

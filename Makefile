install:
	@cd frontend; npm i; cd -
	@cd backend; npm i; cd -

stop.db:
	@docker stop mongo-db; docker rm mongo-db;

run.db:
	@for i in `docker ps -a|column 8`;\
	 do \
	 	if [ "$$i" != "mongo-db" ]; then docker run -d  --name mongo-db -p 27017:27017 mongo; fi; \
	 done

run.frontend:
	@cd frontend; npm start; cd -

run.backend:
	@cd backend; npm start; cd -

run.webpack: exec.docker run.frontend run.backend

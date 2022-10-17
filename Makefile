clean:
	# @rm -rf api/node_modules/
	# @rm -rf ui/node_modules/
	@rm -rf api/dist/ ui/build/
	# @rm */package-lock.json
	@rm -rf ./prod-build

stop.docker:
	@docker stop mongo-db; docker rm mongo-db;

exec.docker:
	@for i in `docker ps -a|column 8`;\
	 do \
	 	if [ "$$i" != "mongo-db" ]; then docker run -d  --name mongo-db -p 27017:27017 mongo; fi; \
	 done

run.webpack: exec.docker
	@cd api; npm run dev-build; cd -
	@cd prod-build; node api/api.bundle.js; cd -
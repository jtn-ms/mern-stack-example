clean:
	@rm -rf api/node_modules/
	@rm -rf ui/node_modules/
	@rm -rf api/dist/ ui/build/
	@rm */package-lock.json

run:
	@docker-compose up

exit:
	@docker-compose down

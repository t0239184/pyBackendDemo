help: ## print all targets
	@echo 'usage: make [target] ...'
	@echo ''
	@echo 'targets:'
	@egrep '^(.+)\:\ .*##\ (.+)' ${MAKEFILE_LIST} | sed 's/:.*##/#-/' | column -t -c 2 -s '#'

export_requirement: ## export installed library to requirements.txt
	pip freeze > requirements.txt

format_all: ## format all python files
	find . -name '*.py' -print0 | xargs -0 -n1 -I{} autopep8 --in-place "{}

server_start: ## start flask server
	python main.py

coverage: ## run test coverage and generate html report
	rm -rf htmlcov
	pytest --cov --cov-report=html

test: ## run unit tests
	pytest

test_module: ## run unit tests for module
	@read -p "Enter Module Path (ex:app/api):" module; \
	pytest --cov=$$module

clean: ## clean
	rm -rf .coverage htmlcov/

docker-start: ## start docker container, including mysql, redis
	docker-compose up -d

docker-shutdown: ## stop docker container
	docker-compose down

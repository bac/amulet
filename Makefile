clean:
	find . -name '*.pyc' -delete
	find . -name '*.bak' -delete
	rm -f .coverage

test:
	@echo Testing Python 3...
	@nosetests3 --nologcapture
	@echo Testing Python 2...
	@nosetests --nologcapture

coverage:
	@echo Testing with coverage...
	@nosetests3 --nologcapture --with-coverage --cover-package=juju_tests

lint:
	@echo  Validating Python syntax...
	@echo "`find -name "*.py" -exec pep8 {} \;`" && pep8 bin/amulet && echo OK

check: test lint

all: clean coverage lint

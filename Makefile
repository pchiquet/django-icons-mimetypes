PACKAGE=icons_mimetypes

all:

clean:
	find $(PACKAGE) "(" -name "*.pyc" -or -name "*.pyo" -or -name "*.mo" -or -name "*.so" ")" -delete
	find $(PACKAGE) -type d -empty -delete
	find $(PACKAGE) -name __pycache__ -delete
	find $(PACKAGE)_dev "(" -name "*.pyc" -or -name "*.pyo" -or -name "*.mo" -or -name "*.so" ")" -delete
	find $(PACKAGE)_dev -type d -empty -delete
	find $(PACKAGE)_dev -name __pycache__ -delete

docs:
	rst2html.py README.rst > README.html

test: clean
	python manage.py test

coverage: clean
	coverage erase
	coverage run --source=$(PACKAGE) manage.py test --noinput
	coverage html

release: test
	python setup.py sdist

.PHONY: clean docs test coverage release

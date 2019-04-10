PYTHON=python3
PIP=pip3

%.python_project:
	@echo "generating a new python project"
	putup $(basename $@)
	mv Makefile $(basename $@)

develop:
	$(PYTHON) setup.py develop

build:
	$(PYTHON) setup.py bdist_wheel

ansible_project:
	@echo "generating a new ansible project"


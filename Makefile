VENV = .venv
PYTHON_VER = 3.8
PYTHON = $(VENV)/bin/python$(PYTHON_VER)
PIP = $(VENV)/bin/pip$(PYTHON_VER)

install-venv:
	@apt install python$(PYTHON_VER)-venv

activate-venv: requirements.txt install-venv
	python$(PYTHON_VER)	-m	venv	$(VENV)
	$(PIP) install --upgrade pip && $(PIP) install	-r	requirements.txt

run: activate-venv
	$(PYTHON)	script.py

test: 
	$(PYTHON) -m pytest -vv --cov=script tests.py

format:
	$(PYTHON) -m black *.py

lint:
	$(PYTHON) -m pylint --disable=R,C,W1203,E1101 script

clean:
	rm	-rf	__pycache__
	rm	-rf	.coverage
	rm	-rf	.pytest_cache

all: run test format lint clean




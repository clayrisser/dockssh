CWD := $(shell readlink -en $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
SHELL := /bin/bash

.PHONY: all
all: clean

env:
	virtualenv env
	env/bin/pip install -r requirements.txt
	$(info created virtualenv)

.PHONY: freeze
freeze:
	env/bin/pip freeze > requirements.txt
	$(info dependancies frozen)

.PHONY: clean
clean:
	@rm -rf **/*.pyc
	@rm -rf env
	$(info cleaned)

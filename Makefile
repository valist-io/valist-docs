SHELL=/bin/bash

all: clean install docs

install-md:
	pip install mkdocs mkdocs-material

install-js: clone-js-repo
	npm install --prefix ./valist-js/sdk

install: install-md install-js

clean-js:
	rm -Rf valist-js

clean-md:
	rm -Rf site

clean: clean-js clean-md

clone-js-repo: clean-js
	git clone --depth 1 https://github.com/valist-io/valist-js.git

js-docs:
	npm run --prefix ./valist-js/sdk docs

md-docs: clean-md
	cd docs && mkdocs build
	mv docs/site .

dev:
	cd docs && mkdocs serve

docs: md-docs js-docs

.PHONY: docs
DIRS = dist

default:
	@echo ""
	@echo "Usage:"
	@echo "   make build"

build: create-dirs npm-install 6to5 watch

create-dir: $(DIRS)
	mkdir $@

npm-install:
	npm install

watch:
	watch build /foo/bar/*

6to5:
	6to5 --compile src/consistenty.js dist/consistenty.js

MAKEFLAGS=-s
.PHONY: default build create-dir npm-install watch 6to5
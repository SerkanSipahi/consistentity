
.PHONY: default build create-dirs npm-install watch 6to5 clean clean-node_moudles clean-dirs
MAKEFLAGS=-s

##########################################

DIRS = dist

##########################################

default:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available Targets:"
	@echo "   make build                build consistenty lib"
	@echo "   make create-dirs          create dist directory"
	@echo "   make npm-install          install npm node modules"
	@echo "   make watch                trigger build target on change any files"
	@echo "   make 6to5                 compile consistenty.js from es6 to es5"
	@echo "   make clean                trigger clean-node_moudles + clean-dirs targets"
	@echo "   make clean-node_moudles   remove node_modules directory"
	@echo "   make clean-dirs           remove $(DIRS) directory"
	@echo ""

##########################################

build: npm-install create-dirs 6to5
#build: create-dirs npm-install

##########################################

create-dirs:
	@mkdir $(DIRS)

npm-install:
	@npm install

watch:
	watch 6to5 /foo/bar/*

6to5:
	node_modules/.bin/6to5 -c -e -t src/consistentity.js -o dist/consistentity.js

##########################################

clean: clean-node_modules clean-dirs

clean-node_modules:
	@rm -rf node_modules			

clean-dirs:
	@rm -rf $(DIRS)

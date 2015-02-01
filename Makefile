
dirs = dist
module ?= ignore
karma_config ?= dist/karma.conf.js
6to5_watch ?=

6to5_bin = node_modules/.bin/6to5
karma_bin = node_modules/karma/bin/karma

##########################################

default:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available Targets:"
	@echo ""
	@echo "   make build module=<name>      "
	@echo "      @modules:"
	@echo "       - amd"
	@echo "       - amdStrict"
	@echo "       - common"
	@echo "       - commonStrict"
	@echo "       - ignore"
	@echo "       - system"
	@echo "       - umd"
	@echo "       - umdStrict"
	@echo "      @default:"
	@echo "       - module=ignore"
	@echo ""
	@echo "   make tests                run tests"
	@echo "   make create-dirs          create dist directory"
	@echo "   make npm-install          install npm node modules"
	@echo "   make watch                trigger build target on change any files"
	@echo "   make 6to5                 compile consistenty.js from es6 to es5"
	@echo "   make clean                trigger clean-node_moudles + clean-dirs targets"
	@echo "   make clean-node_moudles   remove node_modules directory"
	@echo "   make clean-dirs           remove $(dirs) directory"
	@echo ""

##########################################

build: npm-install create-dirs 6to5

##########################################

npm-install:
	@npm install

create-dirs:
	@mkdir $(dirs)

6to5:
	$(6to5_bin) -c -e -t $(6to5_watch) src/consistentity.js -o dist/consistentity.js -m $(module) & \
	$(6to5_bin) -e -t $(6to5_watch) src/karma.conf.js -o dist/karma.conf.js -m common

test:
	$(karma_bin) start $(karma_config) & $(karma_bin) run

watch:
	make 6to5 6to5_watch=-w

##########################################

clean: clean-node_modules clean-dirs

clean-node_modules:
	@rm -rf node_modules			

clean-dirs:
	@rm -rf $(dirs)

##########################################

.PHONY: default build create-dirs npm-install watch 6to5 test clean clean-node_moudles clean-dirs
MAKEFLAGS = -s

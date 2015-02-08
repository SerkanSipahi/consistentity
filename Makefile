
dirs = dist
module ?= ignore
6to5_watch ?=

karma_config_dist ?= dist/karma.conf
karma_config_src ?= src/karma.conf

consist_dist ?= dist/consistentity
consist_src ?= src/consistentity

6to5_bin = node_modules/.bin/6to5
uglifyjs_bin = node_modules/.bin/uglifyjs
karma_bin = node_modules/karma/bin/karma

uglifyjs = $(consist_dist) $(karma_config_dist)

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
	@echo "   make build         build ES6 to ES5"
	@echo "   make build-es6     build no converting" 
	@echo "   make tests         run tests"
	@echo "   make npm-install   install required npm node modules"
	@echo "   make watch         trigger build target on change any files"
	@echo "   make clean         trigger clean-node_moudles + clean-dirs targets"
	@echo ""

##########################################

build: npm-install create-dirs 6to5 $(uglifyjs)
build-es6: npm-install

##########################################

npm-install:
	@npm i

create-dirs:
	@mkdir $(dirs)

6to5:
	$(6to5_bin) -c -e -s $(6to5_watch) $(consist_src).js -o $(consist_dist).js -m $(module) & \
	$(6to5_bin) -e -s $(6to5_watch) $(karma_config_src).js -o $(karma_config_dist).js -m common

$(uglifyjs): 
	$(uglifyjs_bin) \
	$@.js \
     -o $@.min.js \
     --source-map $@.min.js.map \
     --source-map-root $@.min.js

test:
	$(karma_bin) start $(karma_config_dist) & $(karma_bin) run

watch:
	make 6to5 6to5_watch=-w

##########################################

clean: clean-node_modules clean-dirs

clean-node_modules:
	@rm -rf node_modules			

clean-dirs:
	@rm -rf $(dirs)

##########################################

.PHONY: default build create-dirs npm-install watch 6to5 $(uglifyjs) test clean clean-node_moudles clean-dirs
MAKEFLAGS = -s

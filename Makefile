
dirs = dist
module ?= ignore
babel_watch ?=

karma_config_dist ?= dist/karma.conf
karma_config_src ?= src/karma.conf

consist_dist ?= dist/consistentity
consist_src ?= src/consistentity

babel_bin = node_modules/.bin/babel
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

build: npm-install create-dirs babel $(uglifyjs)
build-es6: npm-install

##########################################

npm-install:
	@npm i

create-dirs:
	@mkdir $(dirs)

babel:
	$(babel_bin) -c -e -s $(babel_watch) $(consist_src).js -o $(consist_dist).js -m $(module) & \
	$(babel_bin) -e -s $(babel_watch) $(karma_config_src).js -o $(karma_config_dist).js -m common

$(uglifyjs): 
	$(uglifyjs_bin) \
	$@.js \
     -o $@.min.js \
     --source-map $@.min.js.map \
     --source-map-root $@.min.js

test:
	$(karma_bin) start $(karma_config_dist) & $(karma_bin) run

watch:
	make babel babel_watch=-w

##########################################

clean: clean-node_modules clean-dirs

clean-node_modules:
	@rm -rf node_modules			

clean-dirs:
	@rm -rf $(dirs)

##########################################

.PHONY: default build create-dirs npm-install watch babel $(uglifyjs) test clean clean-node_moudles clean-dirs
MAKEFLAGS = -s

## ConsistEntity
[![npm](https://img.shields.io/npm/v/consistentity.svg?style=flat)](https://www.npmjs.com/package/consistentity)
[![devDependency Status](https://david-dm.org/SerkanSipahi/consistentity/dev-status.svg)](https://david-dm.org/SerkanSipahi/consistentity#info=devDependencies)

>Maintain Datas/Collections at one point.

## Getting Started

This library is written in ECMAScript 6, therefore it requires Node.js >=0.10.00 and the npm( node-package-manager ) >=1.3.0 for transforming ES6 Code to ES5. Please make sure that you have installed Node.js and npm before you run e. g. "make build"( see below Usage ). You also need [make](http://goo.gl/i5CuuV) which is already available on Linux and MacOS.

#### Info:

If you use the installer( Mac/Windows ) you dont have to install npm( it comes with Node.js now ).

#### Downloads:

[Node.js](http://nodejs.org/download/),
[npm](https://www.npmjs.com/package/npm)

## Why ConsitEntity?

...
...

## Usage

...
...

## Available Make Targets

```make
   
make build module=<name>
  @modules:
   - amd
   - amdStrict
   - common
   - commonStrict
   - ignore
   - system
   - umd
   - umdStrict
  @default:
   - module=ignore

make build                build ES6 to ES5
make build-es6            build no converting
make tests                run tests
make create-dirs          create dist directory
make npm-install          install npm node modules
make watch                trigger build target on change any files
make 6to5                 compile consistenty.js from es6 to es5
make clean                trigger clean-node_moudles + clean-dirs targets
make clean-node_moudles   remove node_modules directory
make clean-dirs           remove dist directory

```

## Todos

* minifyjs
* sourcemap inline, file
* gh-pages
* traceur support
* 6to5, done

## Maintainers

* [@SerkanSipahi](https://github.com/SerkanSipahi)

## License

(C) Serkan Sipahi 2015, released under the MIT license
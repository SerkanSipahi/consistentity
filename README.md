### @Documentation in progress

## ConsistEntity
[![npm](https://img.shields.io/npm/v/consistentity.svg?style=flat)](https://www.npmjs.com/package/consistentity)
[![devDependency Status](https://david-dm.org/SerkanSipahi/consistentity/dev-status.svg)](https://david-dm.org/SerkanSipahi/consistentity#info=devDependencies)

>Maintain your Datas/Entities at one point and manipulate it( encapsulated ) at one point with a small(~1kb), well tested, Libraray.
 
## Getting Started

This library is written in ECMAScript 6, therefore it requires Node.js >=0.10.00 and the npm( node-package-manager ) >=1.3.0 for transforming ES6 Code to ES5. Please make sure that you have installed Node.js and npm before you run e. g. "make build"( see below Usage ). You also need [make](http://goo.gl/i5CuuV) which is already available on Linux and MacOS.

#### Info:

If you use the installer( Mac/Windows ) you dont have to install npm( it comes with Node.js now ).

#### Downloads:

* [Node.js](http://nodejs.org/download/)
* [npm](https://www.npmjs.com/package/npm)

## Why ConsitEntity? See below common situation!

#### Entities from somewhere( Database, etc. )
```js

var entities = [
        {
            row : {
                location : 'Hamburg',
                foo : {
                    zipcode : '22117',
                    bar : {
                        brand : 'Mercedes'
                    }
                }
            }
        },
        {
            row : {
                location : 'Köln',
                foo : {
                    zipcode : '33443',
                    bar : {
                        brand : 'VW'
                    }
                }
            }
        },
        {
            row : {
                location : 'München',
                foo : {
                    zipcode : '88773',
                    bar : {
                        brand : 'BMW'
                    }
                }
            }
        },
        ...,
        ...,
        ...,
        ...,
        ...,
        ...,
];

```

#### Many templates that use the same entities
```html

// advertising.handlebars
<div class="ad">
    {{#each entities}}
    <div class="ad-location">Location: {{row.location}}</div>
    <div class="ad-zip">Zipcode: {{row.foo.zipcode}}</div>
    <div class="ad-brand">Brand: {{row.foo.bar.brand}}</div>
    {{/each}}
</div>

// results.handlebars
<div class="results">
    {{#each entities}}
    <div class="item-wrapper">
        <div class="col-xs-4">
            <div class="res-location">Location: {{row.location}}</div>
        </div>
        <div class="col-xs-4">
            <div class="res-zip">Zipcode: {{row.foo.zipcode}}</div>
        </div>
        <div class="col-xs-4">
            <div class="res-brand">Brand: {{row.foo.bar.brand}}</div>
        </div>
    </div>
    {{/each}}
</div>

// product.handlebars
<div class="product">
    {{#each entities}}
    <div class="teaser">
        <img src="path/to/brandimages/{{row.foo.bar.brand}}.jpg" />
        <div class="product-brand">{{row.foo.bar.brand}}</div>
    </div>
    <div class="product-location">{{row.location}}</div>
    <div class="product-zip">{{row.foo.zipcode}}</div>
    {{/each}}
</div>

// and many other templates
...
...
...

```

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
* 6to5, done,
* constributors welcome

## Maintainers

* [@SerkanSipahi](https://github.com/SerkanSipahi)

## License

(C) Serkan Sipahi 2015, released under the MIT license
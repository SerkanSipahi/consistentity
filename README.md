## ConsistEntity
[![npm](https://img.shields.io/npm/v/consistentity.svg?style=flat)](https://www.npmjs.com/package/consistentity)
[![devDependency Status](https://david-dm.org/SerkanSipahi/consistentity/dev-status.svg)](https://david-dm.org/SerkanSipahi/consistentity#info=devDependencies)

>Maintain your Datas/Entities at one point and manipulate it( encapsulated ) at one point with a small(~1kb), well tested, Libraray.
 
## Getting Started

This library is written in ECMAScript 6, therefore it requires Node.js >=0.10 and the npm( node-package-manager ) >=1.3 for transforming ES6 Code to ES5. Please make sure that you have installed Node.js and npm before you run e. g. "make build"( see below Install ). You also need [make](http://goo.gl/i5CuuV) which is already available on Linux and MacOS.

#### Info:

If you use the installer npm comes with Node.js now

#### Downloads:

* [Node.js](http://nodejs.org/download/)
* [npm](https://www.npmjs.com/package/npm)

#### Install ConsistEntity with this command(s):

```shell
// this command transform ES6 Code to ES5 without any module dependency!
make build
// this command is equivalent to "make build"
make build module=ignore

// following modules are supported:
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

```

#### If the build was successful you will find the library in:
```js
dist/consistentity.js
```

##### Implementation and building for Browser

```make
make build
```

```html
<!DOCTYPE html>
<html>
    <head>
        <script src="path/to/lib/consistentity.js"></script>
    </head>
    <body>
        Content of the document......
    </body>
</html>
```

##### Implementation and building for AMD

```make
make build module=amd
```

```js
requre(['consistentity'], function(Consistentity){
    ...
    ...
});
```

##### Implementation and building for commonjs

```make
make build module=common
```

```js
var Consistentity = require('consistentity');
...
...
```

##### Implementation and building for systemjs

```make
make build module=common
```

```js
import BaseComponent from 'consistentity';

// or

System.import('consistentity').then(function(Consistentity) {
    ...
    ...
});

```


#### Test your build in the Browser:
Note: before you run the test please open `http://localhost:9876` in your Browser
```js
make test
```

#### ConsistEntity is well tested in:
* Chrome, Firefox, Safari, Opera, IE10, IE11

## Why ConsitEntity? See below common situation!

##### Entities from somewhere( Database, etc. )
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

##### Many templates that use the same entities
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

But why is that( see below common situation ) not maintainable? Well, the answer is very simple! If your entities struct are changed then you have to correct it in all template files. 

#### Thats why you have to use ConsistEntity:

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

// control and/or manipulate your entity at one point
var accessor = {
        get location() { 
            return this.entity.row.location;
        },
        get zipcode() { 
            return this.entity.row.foo.zipcode;
        },
        get brand() { 
            var brand = this.entity.row.foo.bar.brand;
            return '*** '+ brand.toUpperCase() + ' ***';
        }
};

var entities = (new ConsistEntity(accessor, entities)).getDatas();

``` 

```html

// advertising.handlebars
<div class="ad">
    {{#each entities}}
    <div class="ad-location">Location: {{row.location}}</div>
    <div class="ad-zip">Zipcode: {{row.zipcode}}</div>
    <div class="ad-brand">Brand: {{row.brand}}</div>
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
            <div class="res-zip">Zipcode: {{row.zipcode}}</div>
        </div>
        <div class="col-xs-4">
            <div class="res-brand">Brand: {{row.brand}}</div>
        </div>
    </div>
    {{/each}}
</div>

// product.handlebars
<div class="product">
    {{#each entities}}
    <div class="teaser">
        <img src="path/to/brandimages/{{row.brand}}.jpg" />
        <div class="product-brand">{{row.brand}}</div>
    </div>
    <div class="product-location">{{row.location}}</div>
    <div class="product-zip">{{row.zipcode}}</div>
    {{/each}}
</div>

// and many other templates
...
...
...

```

## Todos
* https://coveralls.io
* constributors welcome

## Maintainers

* [@SerkanSipahi](https://github.com/SerkanSipahi)

## License

(C) Serkan Sipahi 2015, released under the MIT license
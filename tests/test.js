
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
        }
];

var accessor = {
        get location() { 
            return this.entity.row.location;
        },
        get zipcode() { 
            return this.entity.row.foo.zipcode;
        },
        get brand() { 
            return this.entity.row.foo.bar.brand;
        }
};

var datas = (new ConsistEntity(accessor, entities)).getDatas();

describe("A suite", function() {

    var entity_1, entity_2, entity_3;

    beforeEach(function() {
        entity_1 = datas[0];
        entity_2 = datas[1];
        entity_3 = datas[2];
    });

    it("contains spec with an expectation", function() {
        expect('Hamburg').toBe(entity_1.location);
        expect('33443').toBe(entity_2.zipcode);
        expect('BMW').toBe(entity_3.brand);
    });

});

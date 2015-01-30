class ConsistEntity {
	constructor(accessor={}, entities=[{}]){
        this.entities = [];
        this.init(entities);
	}
    init(entities)
        entities.forEach(function(entity, _){
            ConsistEntityModel.prototype = Object.create(accessor);
            this.entities.push(new ConsistEntityModel(entity));
        });
    }
    getEntities(){
        return this.entities;
    }
};

function ConsistEntityModel(entity){
    this.entity = entity;
}

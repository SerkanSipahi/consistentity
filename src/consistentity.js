
class ConsistEntity {
	constructor(accessor={}, entities=[{}]){
        this.entities = entities;
        this.entitiesModels = [];
        this.init();
	}
    init()
        this.entities.forEach((entity, _) => {
            ConsistEntityModel.prototype = Object.create(accessor);
            this.entitiesModels.push(new ConsistEntityModel(entity));
        });
        this.entities = [{}];
    }
    getEntities(){
        return this.entitiesModels;
    }
};

function ConsistEntityModel(entity){
    this.entity = entity;
}
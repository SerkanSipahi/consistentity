/**
 * @author Serkan Sipahi
 * @email serkan.sipahi@yahoo.de
 * @license MIT license
 */
export default class ConsistEntity {
    /**
     * @param  {Object} accessor
     * @param  {Array} entities
     * @return {undefined}
     */
    constructor(accessor={}, entities=[{}]){
        this.tmpEntities = entities;
        this.entitiesModels = [];
        this.init();
    }
    /**
     * @return {undefined}
     */
    init(){
        this.createEntitiesModels();
        this.deleteTmpEntities();
    }
    /**
     * @return {undefined}
     */
    createEntitiesModels(){
        this.tmpEntities.forEach((entity, _) => {
            ConsistEntityModel.prototype = Object.create(accessor);
            this.entitiesModels.push(new ConsistEntityModel(entity));
        });
    }
    /**
     * @return {undefined}
     */
    deleteTmpEntities(){
        this.tmpEntities = [{}];
    }
    /**
     * [getDatas description]
     * @return {Object} this.entitiesModels
     */
    getDatas(){
        return this.entitiesModels;
    }
};

/**
 * @param {Object} entitiy
 * @return {Instance} of ConsistEntityModel
 */
function ConsistEntityModel(entity){
    this.entity = entity || {};
}

/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;

var City = restful.model('cities', mongoose.Schema({
    city_id: Number,
    name: String
})).methods(['get', 'post', 'put', 'delete']);


module.exports = City;
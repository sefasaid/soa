/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;

var City = restful.model('cities', mongoose.Schema({
    il: Number,
    isim: String
})).methods(['get', 'post', 'put', 'delete']);


module.exports = City;
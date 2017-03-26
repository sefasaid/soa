/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;
var Tag = restful.model('tag', mongoose.Schema({
    name: String
})).methods(['get', 'post', 'put', 'delete']);

module.exports = Tag;
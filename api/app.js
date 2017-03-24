/**
 * Created by sefasaid on 24/03/2017.
 */
var express = require('express'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override'),
    morgan = require('morgan'),
    restful = require('node-restful'),
    mongoose = restful.mongoose;
var app = express();

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({type:'application/vnd.api+json'}));
app.use(methodOverride());

mongoose.connect("mongodb://localhost/soa");

var Resource = app.resource = restful.model('city', mongoose.Schema({
    name: String
})).methods(['get', 'post', 'put', 'delete']);

Resource.register(app, '/api/city');

app.listen(3000);
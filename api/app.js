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

mongoose.connect("mongodb://localhost:27017/soa");

var City = app.resource = restful.model('cities', mongoose.Schema({
    il: Number,
    isim: String
})).methods(['get', 'post', 'put', 'delete']);

City.register(app, '/city');

var Place = app.resource = restful.model('places', mongoose.Schema({
    sehir : {type:mongoose.Schema.Types.ObjectId, ref:'cities'},
    isim : String,
    foto : [],
    geo: {type: [Number], index: '2d'},
    kategori : String
})).methods(['get', 'post', 'put', 'delete']);

Place.register(app, '/place');

app.listen(3000);
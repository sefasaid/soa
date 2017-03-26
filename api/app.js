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

var City = require('./models/city_model').register(app, '/city');

var Comment = require('./models/comment_model').register(app, '/comment');

var Place = require('./models/place_model').register(app, '/place');

var Tag = require('./models/tag_model').register(app, '/tag');

var User = require('./models/user_model').register(app, '/user');

app.listen(1453);
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
    sehir : {type:mongoose.Schema.Types.ObjectId, ref:'cities' ,autopopulate: true},
    isim : String,
    foto : [],
    geo: {type: [Number], index: '2d'},
    kategori : String
}).plugin(require('mongoose-autopopulate'))).methods(['get', 'post', 'put', 'delete']);

Place.before('get', find_near);

function find_near(req, res, next) {
    var distance = 1000 / 5371;
    if(req.query.lat && req.query.lng){
        var query = Place.find({'geo': {
            $nearSphere: [
                req.query.lat,
                req.query.lng
            ],
            $maxDistance: distance
        }});

        query.exec(function (err, place) {
            if (err) {
                console.log(err);
            }

            if (!place) {
                res.json({});
            } else {
                res.json(place);
            }
        });
    }else if(req.query.search){
        Place.find({isim: new RegExp(req.query.search, "i")})
            .exec(function(err, place) {
            if (!place) {
                res.json({});
            } else {
                res.json(place);
            }
        })
    } else{
        next();
    }

}
Place.register(app, '/place');

var User = app.resource = restful.model('user', mongoose.Schema({
    gender: String,
    name: {
        title: String,
        first: String,
        last: String
    },
    location: {
        street: String,
        city: String,
        state: String,
        postcode: Number
    },
    email: String,
    dob: String,
    registered: String,
    phone: String,
    cell: String,
    picture: {
        large: String,
        medium: String,
        thumbnail: String
    },
    nat: String
})).methods(['get', 'post', 'put', 'delete']);

User.register(app, '/user');
app.listen(1453);
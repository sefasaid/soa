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

var Comment = app.resource = restful.model('comment', mongoose.Schema({
    yorum: String,
    kullanici : {type:mongoose.Schema.Types.ObjectId, ref:'user' ,autopopulate: true}
}).plugin(require('mongoose-autopopulate'))).methods(['get', 'post', 'put', 'delete']);

Comment.before('post', update_place);

function update_place(req, res, next) {
    if(req.body.place_id == null){
        res.status(400);
        res.json({error:"Lütfen place_id giriniz"});
    }else{
        var yorum = new Comment();
        yorum.yorum = req.body.yorum;
        yorum.kullanici = req.body.user_id;
        yorum.save(function (err,comment) {
            if(err)
                console.log(err);
            Place.findOneAndUpdate(req.body.place_id,
                {$push: {"yorumlar": yorum._id}},
                {safe: true, upsert: true},function (err,ok) {
                    if(err)
                        console.log(err);
                    else{
                        res.status(201);
                        res.json({status:"ok"});
                    }
            })
        });


    }
}
Comment.register(app, '/comment');


var Place = app.resource = restful.model('places', mongoose.Schema({
    sehir : {type:mongoose.Schema.Types.ObjectId, ref:'cities' ,autopopulate: true},
    isim : String,
    foto : [],
    geo: {type: [Number], index: '2d'},
    kategori : String,
    yorumlar : {type:[mongoose.Schema.Types.ObjectId], ref:'comment' ,autopopulate: true}
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

var Tag = app.resource = restful.model('tag', mongoose.Schema({
    isim: String
})).methods(['get', 'post', 'put', 'delete']);

Tag.register(app, '/tag');

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
    nat: String,
    tag : {type:[mongoose.Schema.Types.ObjectId], ref:'tag' ,autopopulate: true}
}).plugin(require('mongoose-autopopulate'))).methods(['get', 'post', 'put', 'delete']);

User.before('get', random_user);
function random_user(req, res, next) {
    if(req.query.rand != null && req.query.limit){
        var limit = parseInt(req.query.limit)
        User.count(function(err, count) {
            if (err) {
                return callback(err);
            }
            var rand = Math.floor(Math.random() * count);
            console.log(rand);
            User.find().skip(rand).limit(limit).exec(function (err,users) {
                if(err)
                    console.log(err);
                if (!users) {
                    res.json({});
                } else {
                    res.json(users);
                }
            });
        });
    }else if(req.query.limit && req.query.tag != null){
        User.find({ "tag.isim" : new RegExp(req.query.tag, "i")})
            .limit(req.query.limit)
            .exec(function(err, place) {
                if (!place) {
                    res.json({});
                } else {
                    res.json(place);
                }
            })
    }else{
        next();
    }
}
User.register(app, '/user');
app.listen(1453);
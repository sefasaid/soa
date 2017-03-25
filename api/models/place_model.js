/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;
var redisClient = require('redis').createClient;
var redis = redisClient(6379, 'localhost');

var Place = restful.model('places', mongoose.Schema({
    sehir : {type:mongoose.Schema.Types.ObjectId, ref:'cities' ,autopopulate: true},
    isim : String,
    foto : [],
    geo: {type: [Number], index: '2d'},
    kategori : String,
    yorumlar : [{type:mongoose.Schema.Types.ObjectId, ref:'comment'}]
}).plugin(require('mongoose-autopopulate'))).methods(['get', 'post', 'put', 'delete']);

Place.before('get', find_near);
Place.after('get', get_redis);

function find_near(req, res, next) {
    var distance = 1000 / 5371;
    if(req.params.id != null){
        redis.get(req.params.id, function (err, reply) {
            if (err) callback(null);
            else if (reply) {
                console.log("sending from redis");
                res.json(JSON.parse(reply));
            } else {
                next();
            }
        })
    }else if(req.query.lat && req.query.lng){
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
    }else if(Object.keys(req.query).length === 0){
        redis.get('places', function (err, reply) {
            if (err) callback(null);
            else if (reply){
                console.log("sending from redis");
                res.json(JSON.parse(reply));
            } else {
                next();
            }
        })
    }else{
        next();
    }
}
function get_redis(req,res,next) {
    if(req.params.id != null){
        redis.set(req.params.id, JSON.stringify(res.locals.bundle), function () {
            console.log("SAVİNG TO REDİS");
            redis.expire(req.params.id, 60);

            next();
        });
    }else if(req.query.length == undefined){
        redis.set('places', JSON.stringify(res.locals.bundle), function () {
            console.log("SAVİNG TO REDİS");
            redis.expire('places', 30);

            next();
        });
    }else{
        next();
    }

}

module.exports = Place;
/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;
var User = restful.model('user', mongoose.Schema({
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

module.exports = User;
/**
 * Created by sefasaid on 25/03/2017.
 */
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.connect('mongodb://localhost:27017/soa');
var userSchema = new Schema({
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
    tag: {type: [mongoose.Schema.Types.ObjectId], ref: 'tag'}
});
var User = mongoose.model('user', userSchema);
var tagSchema = Schema({
    isim: String
});
var Tag = mongoose.model('tag', tagSchema);

User.find({}, function (err, users) {
    console.log(users.length);

    Tag.count(function (err, count) {

        users.forEach(function (user) {
            if (err) {
                return callback(err);
            }
            var rand = Math.floor(Math.random() * count);
            var limit = Math.floor(Math.random() * count);

            Tag.find({}, '_id').skip(rand).limit(limit).exec(function (err, tag) {
                if (err)
                    console.log(err);
                console.log("tags", tag);
                console.log("user", user._id);
                User.findByIdAndUpdate(user._id, {$set: {tag: tag}}, function (err, num) {
                    if (err)
                        console.log(err);
                });
            });
        })


    })

})


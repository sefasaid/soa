/**
 * Created by sefasaid on 25/03/2017.
 */
var request = require("request");
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.connect('mongodb://localhost:27017/soa');

var url = "https://randomuser.me/api/?results=5000&nat=tr";
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
    nat: String
});
var User = mongoose.model('user', userSchema);
request({
    url: url,
    json: true
}, function (error, response, body) {

    if (!error && response.statusCode === 200) {
        for( var k = 0 ; k < body.results.length ; k++){
            var user = new User();
            user.gender = body.results[k].gender;
            user.name = body.results[k].name;
            user.location = body.results[k].location;
            user.email = body.results[k].email;
            user.dob = body.results[k].dob;
            user.registered = body.results[k].registered;
            user.phone = body.results[k].phone;
            user.cell = body.results[k].cell;
            user.picture = body.results[k].picture;
            user.nat = body.results[k].nat;
            user.save(function (err) {
                console.log(err);
            });
        }
    }
})

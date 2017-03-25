/**
 * Created by sefasaid on 25/03/2017.
 */
var requestify = require('requestify');
var reqUrl = "http://localhost:1453/comment";
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.connect('mongodb://localhost:27017/soa');
var dumyComments = ['Mekan süper abi!', 'Ba yıl dım!', 'Mutlaka gitmeniz lazım.', 'Gitmeyen bin pişman!', 'Ohaaa!' +
' Ef-sa-neee!', 'Tek kelime ile mükemmel', 'Benimle gitmek isteyen var mı?', 'Fevkalade', 'İnsana değer veren mükemmel' +
' bir mekan.', 'Mutlaka gidilmesi gerekir', 'Hafta sonu tatili için mükemmel bir yer', 'Boş zamanları' +
' değerlendirmek için mükemmel bir yer', 'İşte huzur arayanlar için mükemmel bir yer!'];
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
var placeSchema = Schema({
    sehir: {type: mongoose.Schema.Types.ObjectId, ref: 'cities'},
    isim: String,
    foto: [],
    geo: {type: [Number], index: '2d'},
    kategori: String,
    yorumlar: {type: [mongoose.Schema.Types.ObjectId], ref: 'comment'}
});
var Place = mongoose.model('place', placeSchema);


Place.find({}, function (err, places) {
    if (err)
        console.log(err);
    places.forEach(function (place) {
        var rand = Math.floor(Math.random() * 5000);
        var limit = Math.floor(Math.random() * 10);

        User.find({}, '_id').skip(rand).limit(limit).exec(function (err, users) {
            if (err)
                console.log(err);
            users.forEach(function (user) {
                var rand = Math.floor(Math.random() * 14);
                var comment = dumyComments[rand];


                requestify.post(reqUrl, {'user_id': user._id, 'yorum': comment, 'place_id': place._id})
                    .then(function (response) {

                        response.getBody();
                    });

            })
        })
    })
})
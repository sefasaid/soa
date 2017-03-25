/**
 * Created by sefasaid on 25/03/2017.
 */
var restful = require('node-restful');
var mongoose = restful.mongoose;

var Comment = restful.model('comment', mongoose.Schema({
    comment: String,
    user : {type:mongoose.Schema.Types.ObjectId, ref:'user' ,autopopulate: true}
}).plugin(require('mongoose-autopopulate'))).methods(['get', 'post', 'put', 'delete']);

Comment.before('post', update_place);

function update_place(req, res, next) {
    if(req.body.place_id == null){
        res.status(400);
        res.json({error:"Lütfen place_id giriniz"});
    }else{
        var comment = new Comment();
        comment.comment = req.body.yorum;
        comment.user = req.body.user_id;
        comment.save(function (err,comment) {
            if(err)
                console.log(err);
            Place.findOneAndUpdate(req.body.place_id,
                {$push: {"comments": comment._id}},
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
module.exports = Comment;
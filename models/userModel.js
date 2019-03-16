const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    username        :  {type : String, required: true},
    uid             :  {type : String, required: true},
    logs            :  {type : Array,  "default"  : []},
    thumbnailUrl    :  {type : String, required: true}
});

const User = mongoose.model('user', userSchema);
module.exports = User;
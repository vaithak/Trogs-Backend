const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    username        :  {type : String, required: true},  // Username/email of user as provided by Okta
    uid             :  {type : String, required: true},  // Unique ID of user as provided by Okta
    logs            :  {type : Array,  "default"  : []}, // Storing Array of unique reference Id's of logs
    thumbnailUrl    :  {type : String, required: true}   // User's profile image url
});

const User = mongoose.model('user', userSchema);
module.exports = User;
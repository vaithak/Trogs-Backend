const express = require("express");
const router  = express.Router();
const Logs    = require('../models/logModel');
const User    = require('../models/userModel');

// Send user data (other than his uid), 
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    Logs.find({"uniqRefId": {"$in": req.userLogs}}).then((results) => {
        let jsonResult = {
            "username"     : req.username,
            "thumbnailUrl" : req.thumbnailUrl,
            "logs"         : results,
            "friends"      : req.userFriends
        };
        res.json(jsonResult);
    })
    .catch((err) => {
        res.status(500).send(err.message);
    });
});

// Search a user's friend by pattern of his username
router.get("/friendsearch", (req, res, next) => {
    let friendPattern = req.query.friendPattern;
    res.status(200).send( (req.userFriends).map(friend => friend.username.includes(friendPattern)) );
});

// Search a user by his username
router.get("/searchuser", (req, res, next) => {
    let username = req.query.uname;
    User.findOne({"username": username}).then((user) => {
        if(user){
            res.json({
                "username" : username,
                "thumbnail": user.thumbnailUrl
            });
        }
        else{
            res.status(400).send("No such user exists");
        }
    })
    .catch((err) => {
        res.status(500).send(err.message);
    });
});

// Add a user's friend
router.get("/addfriend", (req, res, next) => {
    let friendUsername = req.query.uname;
    if(friendUsername == req.username){
        res.status(400).send("Cannot add self as friend");
    }
    else if(req.userFriends.some(el => el.username == friendUsername )){
        res.status(400).send("Friend already exists");
    }
    else{
        User.findOne({"username": friendUsername}).then((user) => {
            if(user){
                let newFriends = req.userFriends;
                newFriends.push({
                    username    : friendUsername,
                    thumbnailUrl: user.thumbnailUrl
                });
                User.findOneAndUpdate({'uid': req.uid}, {$set: {'friends': newFriends}}, () => {
                    res.status(200).send("Friend added successfully!");
                });
            }
            else{
                res.status(400).send("No such user exist");
            }
        })
        .catch((err) => {
            res.status(500).send(err.message);
        });
    }
});

module.exports = router;
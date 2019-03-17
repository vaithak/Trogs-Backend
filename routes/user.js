const express = require("express");
const router  = express.Router();
const Logs    = require('./models/logModel');
const User    = require('./models/userModel');

// Send user data (other than his uid), 
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    Logs.find({"uniqRefId": {"$in": req.userLogs}}).then((results) => {
        let jsonResult = {
            "username"     : req.username,
            "thumbnailUrl" : req.thumbnailUrl,
            "logs"         : results
        };
        res.json(jsonResult);
    })
    .catch((err) => {
        res.status(500).send(err.message);
    });
});

// Search a user's friend by pattern of his username
router.get("/friendsearch/:friendPattern", (req, res, next) => {
    let friendPattern = req.params.friendPattern;
    res.status(200).send( (req.userFriends).map(friend => friend.username.includes(friendPattern)) );
});

// Search a user by his username
router.get("/searchuser/:username", (req, res, next) => {
    let username = req.params.username;
    User.findOne({"username": username}).then((user) => {
        if(user){
            res.json({
                "username" : username,
                "thumbnail": user.thumbnailUrl
            });
        }
        else{
            res.json({});
        }
    })
    .catch((err) => {
        res.status(500).send(err.message);
    });
});

// Add a user's friend
router.get("/addfriend/:friendusername", (req, res, next) => {
    let friendUsername = req.params.friendUsername;
    User.findOne({"username": friendUsername}).then((user) => {
        if(user){
            let newFriends = req.userFriends;
            newFriends.push({
                username    : friendUsername,
                thumbnailUrl: user.thumbnailUrl
            });
            User.findOneAndUpdate({'uid': req.uid}, {$set: {'friends': notes}}, () => {
                res.status(200).send("Friend added successfully!");
            });
        }
        else{
            res.send("No such user exist");
        }
    })
    .catch((err) => {
        res.status(500).send(err.message);
    });
});

// Delete a user's log if it's present else do nothing
router.get("/logs/delete/:uniqRefId", (req, res, next) => {
    let uniqRefId = req.params.uniqueRefId;
    if (req.userLogs.includes(uniqRefId)){
        Logs.deleteOne({"uniqRefId": uniqRefId}).then(() => {
            res.status(200).send("User deleted successfully!");
        })
        .catch((err) => {
            res.status(500).send(err.message);
        });
    }
    else{
        res.send("No such user exist");
    }
});

module.exports = router;
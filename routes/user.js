const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const User = require("../models/userModel");
const Logs = require("../models/logModel");
// Send user data (other than his uid),
// also send his logs data (excluding sensitive data) by iterating over his logs array.


router.get("/", (req, res, next) => {
    // console.log("hello");
    User.find({"uid" : req.jwt.claims.uid}).then((result)=>{
      userJson = result[0];
      userJson.uid=undefined;//delete is not working also delete is 100 times slower as compared to setting undefined
      res.json(userJson);
    });
});

// Search a user's friend by prefix of a username
router.get("/friendsearch/:friendPrefix", (req, res, next) => {
    let friendPrefix = req.params.friendPrefix;
    // Search user's friends by prefix in req.userFriends
    res.send("Hello");
});

// Search a user's friend by prefix of a username
router.get("/searchuser/:username", (req, res, next) => {
    let friendPrefix = req.params.friendPrefix;
    // Search user's friends by prefix in req.userFriends
    res.send("Hello");
});

// Add user's friend
router.get("/addfriend/:friendusername", (req, res, next) => {
    let friendPrefix = req.params.friendPrefix;
    // Search user's friends by prefix in req.userFriends
    res.send("Hello");
});

// Delete a user's log if it's present else do nothing
router.get("/logs/delete/:uniqRefId", (req, res, next) => {
    var uniqRefId = req.params.uniqueRefId;
    for (var i in req.userLogs){
      if(req.userLogs[i].uniqRefId.valueOf() == uniqRefId.valueOf()){
        Logs.deleteOne({
          "uniqRefId": uniqRefId
        });
      }
    }
    res.json(logId);
});

module.exports = router;

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

// Delete a user's log if it's present else do nothing
router.get("/logs/delete/:uniqRefId", (req, res, next) => {
    var uniqRefId = req.params.uniqueRefId;
    for (var i in req.userLogs){
      if(req.userLogs[i].uniqRefId == uniqRefId){
        Logs.deleteOne({
          "uniqRefId": uniqRefId
        });
      }
    }
    res.json(logId);
});

module.exports = router;

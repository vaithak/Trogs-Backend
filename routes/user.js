const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const User = require("../models/userModel");
// Send user data (other than his uid),
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    // console.log("hello");
    User.find({"uid" : req.jwt.claims.uid}).exec().then((result)=>{
      var userJson = result[0];
      delete userJson.uid;//not working
      console.log(userJson.uid);
      res.json(userJson);
    });
});

// Delete a user's log if it's present else do nothing
router.get("/logs/delete/:uniqRefId", (req, res, next) => {
    var uniqRefId = req.params.uniqueRefId;
    res.json(logId);
});

module.exports = router;

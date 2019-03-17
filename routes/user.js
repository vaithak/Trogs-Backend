const express = require("express");
const router  = express.Router();
const User    = require('./models/userModel');

// Send user data (other than his uid), 
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    res.json(req.jwt);
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
    res.json(logId);
});

module.exports = router;
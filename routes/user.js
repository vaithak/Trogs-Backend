const express = require("express");
const router = express.Router();

// Send user data (other than his uid), 
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    res.json(req.jwt);
});

// Delete a user's log if it's present else do nothing (not even returning error)
router.get("/logs/delete/:logId", (req, res, next) => {
    var logId = req.params.logId;
    res.json(logId);
});

module.exports = router;
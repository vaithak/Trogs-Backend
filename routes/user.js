const express = require("express");
const router = express.Router();

// Send user data (other than his uid), 
// also send his logs data (excluding sensitive data) by iterating over his logs array.
router.get("/", (req, res, next) => {
    res.json(req.jwt);
});

// Delete a user's log if it's present else do nothing
router.get("/logs/delete/:uniqRefId", (req, res, next) => {
    var uniqRefId = req.params.uniqueRefId;
    res.json(logId);
});

module.exports = router;
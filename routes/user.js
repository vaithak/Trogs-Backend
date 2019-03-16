const express = require("express");
const router = express.Router();

// Log a user out
router.get("/", (req, res, next) => {
    res.json(req.jwt);
});


module.exports = router;
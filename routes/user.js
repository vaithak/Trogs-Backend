const express = require("express");
const router = express.Router();

// Log a user out
router.get("/", (req, res, next) => {
  res.send("Hello")
});


module.exports = router;
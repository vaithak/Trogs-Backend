const express = require("express");
const router  = express.Router();
const Logs    = require('./models/logModel');

// Delete a user's log if it's present else do nothing
router.get("/delete", (req, res, next) => {
    let uniqRefId = req.query.id;
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
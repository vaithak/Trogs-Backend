const express = require("express");
const router  = express.Router();
const Logs    = require("../models/logModel");
const amqp    = require("amqplib/callback_api");

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

// Adding a log
router.post("/new", (req,res,next) => {
    let msgData = {
        logData: req.body.msg,
        uid    : req.uid
    }

    amqp.connect('amqp://localhost', (err, conn) => {
        if(err){
            res.status(500).send(err.message);
        }
        else{
            conn.createChannel((err, ch) => {
                if(err){
                    console.log(err.message)
                    res.status(500).send(err.message);
                    conn.close();
                }
                else{
                    let q   = 'task_queue';
                    ch.assertQueue(q, {durable: true});
                    let msg = JSON.stringify(msgData);
                    ch.sendToQueue(q, Buffer.from(msg), {persistent: true});
                    console.log(" [x] Sent " + msg);
                    res.status(200).send("Log sent for processing.");
                    setTimeout(function () { conn.close(); }, 500);
                }
            });
        }
    });
});

module.exports = router;
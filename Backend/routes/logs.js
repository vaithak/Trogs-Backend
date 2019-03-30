const express = require("express");
const router  = express.Router();
const Logs    = require("../models/logModel");
const amqp    = require("amqplib/callback_api");

Logs.createMapping({
    "settings": {
        "number_of_shards": 1,
        "number_of_replicas": 0,
        "analysis": {
            "filter": {
                "nGram_filter": {
                    "type": "nGram",
                    "min_gram": 2,
                    "max_gram": 20,
                    "token_chars": [
                        "letter",
                        "digit",
                        "punctuation",
                        "symbol"
                    ]
                }
            },
            "analyzer": {
                "nGram_analyzer": {
                    "type": "custom",
                    "tokenizer": "whitespace",
                    "filter": [
                        "lowercase",
                        "asciifolding",
                        "nGram_filter"
                    ]
                },
                "whitespace_analyzer": {
                    "type": "custom",
                    "tokenizer": "whitespace",
                    "filter": [
                        "lowercase",
                        "asciifolding"
                    ]
                }
            }
        }
    },
    "mappings": {
        "logs": {
            "_all": {
                "analyzer": "nGram_analyzer",
                "search_analyzer": "whitespace_analyzer"
            },
            "properties":{"msgRefId":{"type":"string"},"genUserId":{"type":"string"},"boolPersonal":{"type":"boolean"},"secUsername":{"type":"string"},"title":{"type":"string"},"amount":{"type":"double"},"completeLog":{"type":"string"},"category":{"type":"string"}}
        }
    }
}, function(err, mapping) {
    if (err) {
        console.log('error creating mapping (you can safely ignore this)');
        console.log(err);
    } else {
        console.log('mapping created!');
        console.log(mapping);
    }
});

//Only for testing purposes
var stream = Logs.synchronize();
var count =0

stream.on('data',function(){
  count++;
});
stream.on('close',function(){
  console.log("Index logs= "+count);
});
stream.on('error',function(){
  console.log(err);
});
//search a query string in log contents
router.post("/search",function(req,res,next){
  Logs.search(
    { completeLog: req.body.queryString, genUserId:req.uid }, function(err,results){
      if(err) return next(err);
      var data = results.hits.hits;
      res.status(200).send(data);
    });
});


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
        logData     : req.body.msg,
        uid         : req.uid,
        userLogs    : req.userLogs,
        boolPersonal: req.body.boolPersonal,
        secUsername : req.body.secUsername
    }

    if (msgData.logData.length == 0 || (msgData.boolPersonal!="true" && msgData.boolPersonal!="false")) {
        res.status(400).send("Invalid request!");
    }
    else if(msgData.boolPersonal == "true" && ( (msgData.secUsername.length == 0) || (!req.userFriends.some(el => el.username == msgData.secUsername ))) ){
        res.status(400).send("Inalid secondary username!");
    }
    else{
        amqp.connect('amqp://dockerdbsetup_messagebroker_1', (err, conn) => {
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
                        let q = 'task_queue';
                        ch.assertQueue(q, {durable: true});
                        let msg = JSON.stringify(msgData);
                        ch.sendToQueue(q, Buffer.from(msg), {persistent: true});
                        res.status(200).send("Log sent for processing.");
                        setTimeout(function () { conn.close(); }, 500);
                    }
                });
            }
        });
    }
});

module.exports = router;

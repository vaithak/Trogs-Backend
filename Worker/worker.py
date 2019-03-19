import pika
import time
import json
import pymongo
import bson
import hashlib
import configparser

# Initializing configurations
config = configparser.ConfigParser()
config.read('config.ini')

# Handling JSON data received in request
def handleRequest(msgJSON):
    client  = pymongo.MongoClient(config['DB']['dbUrl'])
    logsDb  = client["trogsDb"]["logs"]
    usersDb = client["trogsDb"]["users"]

    # Currently hard coded for testing
    title    = "Testing log title: " + msgJSON['logData'][0:6]
    amount   = 1000
    msgRefId = "123456789"
    category = "Personal"

    boolPersonal = True if msgJSON['boolPersonal'] == "true" else False
    newId        = bson.objectid.ObjectId()
    uniqRefId    = hashlib.sha3_224(str(newId).encode('utf-8')).hexdigest()
    userLogs     = msgJSON['userLogs'] if msgJSON['userLogs'] is not None else []
    userLogs.append(uniqRefId)
    saveLogData  = {
        '_id'         : newId,
        'uniqRefId'   : uniqRefId,
        'completeLog' : msgJSON['logData'],
        'boolPersonal': boolPersonal,
        'genUserid'   : msgJSON['uid'],
        'secUsername' : msgJSON['secUsername'],
        'title'       : title,
        'amount'      : amount,
        'msgRefId'    : msgRefId,
        'category'    : category
    }

    result1 = logsDb.insert_one(saveLogData)
    result2 = usersDb.update_one({"uid": msgJSON['uid']}, {"$set" : {"logs": userLogs} })

# Function called as soon as message received from queue
def callback(ch, method, properties, body):
    msgJSON = json.loads(body)
    handleRequest(msgJSON)
    ch.basic_ack(delivery_tag = method.delivery_tag)

# Connect to Rabbitmqserver and create a channel
connection = pika.BlockingConnection(pika.ConnectionParameters(host='dockerdbsetup_messagebroker_1'))
channel = connection.channel()

# Declaring queue with durability enabled
channel.queue_declare(queue='task_queue', durable=True)
print(' [*] Waiting for messages. To exit press CTRL+C')

# For load balancing
channel.basic_qos(prefetch_count=1)

# Start consuming requests from broker
channel.basic_consume(callback, queue='task_queue')
channel.start_consuming()
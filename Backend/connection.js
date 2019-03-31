var elasticsearch = require('elasticsearch');

var client = new elasticsearch.Client( {  
  hosts: [
    'elasticsearch:9200',
  ]
});

module.exports = client;
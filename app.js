const express      = require('express');
var   cors         = require('cors');
var   authRequired = require('./auth');
const app          = express();
const config       = require('./config');
const userRouter   = require("./routes/user");

// connect to mongodb
const mongoose     = require('mongoose');
mongoose.promise   = global.promise;
mongoose.connect(config.db.dbURI,{ useNewUrlParser: true }, function(err) {
  if(err)
  {
    throw err;
    process.exit(0);
  }

  console.log('connected to mongodb');
});

/*
 * For local testing only!  Enables CORS for all domains
 */
app.use(cors());

// Auth MiddleWare
app.use(authRequired);

// Routes
app.use("api/v1/user", userRouter);

// // 404 on missing routes
app.get('/*', function(req, res, next){
    res.status(404).send("Route Not Found");
});

// Starting the server
app.listen(config['app']['port'], () => {
  console.log('Serve Ready on port ' + config['app']['port']);
});
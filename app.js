const express      = require('express');
var   cors         = require('cors');
var   authRequired = require('./auth');
const app          = express();
const config       = require('./config');
const userRouter   = require("./routes/user");

/*
 * For local testing only!  Enables CORS for all domains
 */
app.use(cors());

// Auth MiddleWare
app.use(authRequired);

// Routes
app.use("/user", userRouter);

// // 404 on missing routes
app.get('/*', function(req, res, next){
    res.status(404).send("Route Not Found");
});

// Starting the server
app.listen(config['app']['port'], () => {
  console.log('Serve Ready on port ' + config['app']['port']);
});
const express      = require('express');
var   cors         = require('cors');
var   authRequired = require('./auth');
const app          = express();
const config       = require('./config');
const userRouter   = require("./routes/user");

/**
 * For local testing only!  Enables CORS for all domains
 */
app.use(cors());

/**
 * An example route that requires a valid access token for authentication, it
 * will echo the contents of the access token if the middleware successfully
 * validated the token.
 */
app.get('/secure', authRequired, (req, res) => {
  res.json(req.jwt);
});

/**
 * Another example route that requires a valid access token for authentication, and
 * print some messages for the user if they are authenticated
 */
app.get('/api/messages', authRequired, (req, res) => {
  res.json([{
    message: 'Hello, word!'
  }]);
});

// Routes
app.use("/user", userRouter);

// Error handlers
app.use(function(req, res, next) {
  next(createError(404));
});

app.use(function(err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  res.status(err.status || 500);
  res.render("error");
});

app.listen(config['app']['port'], () => {
  console.log('Serve Ready on port ' + config['app']['port']);
});
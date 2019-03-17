const config = require('./config');
const OktaJwtVerifier = require('@okta/jwt-verifier');
const User = require('./models/userModel');
const md5 = require('md5');

const oktaJwtVerifier = new OktaJwtVerifier({
  issuer: config['okta']['issuerAuthServer'],
  clientId: config['okta']['clientId'],
  assertClaims: {
    aud: config['okta']['apiAudience'],
  },
});

/**
 * A simple middleware that asserts valid access tokens and sends 401 responses
 * if the token is not present or fails validation.  If the token is valid its
 * contents are attached to req.jwt
 */
function authenticationRequired(req, res, next) {
  const authHeader = req.headers.authorization || '';
  const match = authHeader.match(/Bearer (.+)/);

  if (!match) {
    return res.status(401).end();
  }

  const accessToken = match[1];

  return oktaJwtVerifier.verifyAccessToken(accessToken)
    .then((jwt) => {
      req.jwt      = jwt;
      req.uid      = jwt['claims']['uid'];
      req.username = jwt['claims']['sub'];

      User.findOne({uid: req.uid}).then(function(currentUser){
        if(!currentUser){
          // User doesn't exist in DB
          new User({
            uid          : req.uid,
            username     : req.username,
            thumbnailUrl : "https://www.gravatar.com/avatar/" + md5(req.uid) + "?d=robohash"
        }).save().then((newUser) => {
          req.userLogs     = newUser['logs'];
          req.userFriends  = newUser['friends'];
          req.thumbnailUrl = newUser['thumbnailUrl']; 
          next(); 
        });
        }
        else{
          req.userLogs     = currentUser['logs'];
          req.userFriends  = currentUser['friends'];
          req.thumbnailUrl = currentUser['thumbnailUrl']; 
          next();
        }
      })
      .catch((err) => {
        res.status(500).send(err.message);
      });
    })
    .catch((err) => {
      console.log(req.connection.localAddress)
      res.status(401).send(err.message);
    });
}

module.exports = authenticationRequired;
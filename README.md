# Trogs-Backend
Backend repository for Trogs application for Oktane Hackathon.

### How to setup ?
  1) Clone this repo and run -> `npm install`.  
  2) Download config.js into this cloned folder from [here](https://send.firefox.com/download/c48aacce84/#M7E7wYTEZWiACVjpjAR8BQ)  
  3) The setup is complete but follow steps for usage.  

### Usage: 

**Overview**  
* From frontend an accessToken will be sent in Header of each request, then Authorization handler middleware as defined in auth.js file check if the request is valid and put the JWT of the user as returned by Okta in to req.jwt and similarly for email and uid.  
* We will be identifying a user by it's unique uid in our database.  
<hr>. 

**Without Frontend**  

* To test the backend API's we need a valid accessToken, to do that open the accessToken.html by creating a server in python by following these steps (first ensure either you are logged out of all Okta services or either perform the browser steps in Incognito Mode):  

1) On terminal run (from python2), run this in the folder containing the code: 
  ```sh
  $ python -m SimpleHTTPServer  
  ```  
  
2) Now open http://localhost:8000 in Incognito and open accessToken.html with Console of Browser open.  

3) Log into your Okta account, after logging in the accessToken will be logged in console. Copy that token and place it in accessToken variable in test.sh file.  

4) Install [httpie](https://github.com/jakubroztocil/httpie#2installation) on your system.  

4) Then you can manipulate test.sh to test different API's by changing the url and type of request. You can read the [docs](https://httpie.org/doc) of httpie for help.   


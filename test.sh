#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULk45SmljUWxvSnFmV2piakFPcTZpY001WDBrSTI0bzQ4TlUzTFM1Zld0YXciLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1NDAyMjY0MCwiZXhwIjoxNTU0MDI2MjQwLCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.bWBGkNK8yIa-2tczxrw7htfqTfJsigIQA76uvxkGAqsVuvHdHtC4QtVSJAB0n4W4zPv97x-xdQU-pfYoGBcI9xKgzN-OyUiqobhhoqM0ZilGU4s6vhSFzCkRKkgb0nHqR1u3rRdlmWNtJXiPtW6sXMuzS4RKoaQVSSDsaGK6V4kIKu2zQD3g4tEe1ez6GiGLrtdVTXlskp32tmNyjupGKJdif69noP4AiDbXcyjmXYmDSsfwWrT3KJVRNDPdpdJOXUevvBxNwNp2FfI2DAlOkn-2N9rXiZp-TuUOOKuBnvgTGDwIOBEXkP6LSBk5REMPuhdsuMMYJmUZS0liNb-1Uw"

# Get user dashboard data
request="http get http://localhost:8080/api/v1/user/ 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# Search existing user
request="http get http://localhost:8080/api/v1/user/searchuser?uname=vaibhav.thakkar.22.12.99@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# Search non-existing user
request="http get http://localhost:8080/api/v1/user/searchuser?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# Add non existing user as friend
request="http get http://localhost:8080/api/v1/user/addfriend?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# Add existing user as friend
request="http get http://localhost:8080/api/v1/user/addfriend?uname=anand44tanmay@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# Adding new log
msg="Message for testing"
boolPersonal="false"
secUsername=""
request="http --form POST http://localhost:8080/api/v1/logs/new msg='$msg' boolPersonal='$boolPersonal' secUsername='$secUsername' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request
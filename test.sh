#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULlAzM050c3J0b0NmMGh2UGVsZjlibVg4M3BJRmN6Y2x3N3NXVXYtOGtITE0iLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1MzAwMjE3NywiZXhwIjoxNTUzMDA1Nzc3LCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.jUL3yZjQWoCiF1PbUk6zRUWoTbVBkcos_VwHvwQaiIhbYO_2lQCoUIACFiRxD1oAdbovQ9QgTmQpOar_pEHZwTzFFezjGO4OKgcxbIKgQfvJm0WO1Ykrf7Fhkvl1qiYAXLWtfKQeVC0Fk7zskIAOfCSnxxzfb1LaYBM6Az55H6No81LB6jD2oyW7zaujQFB_4E5kfpj78r67y53bUPoWNgvu4p6iQE2J7KqLerMum3-lGMI0w_fEZVtfUetUa7YyBCpPThdieu7xItb5zzxLtLqCz9lGfh48XRcMPw-nHnAaEj4AZ38xfWxHQOTmkzizdcDNbMIsB9wRTBTDaIreYw"

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
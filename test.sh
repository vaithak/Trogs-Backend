#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULmI3THlYanA5dzduVl9YUFpiSHRBSktFbV84SElOeklFc1FmOWtQb1Fhc0kiLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1MjkyOTMzOSwiZXhwIjoxNTUyOTMyOTM5LCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.KeyNeWSgEduQ_KBNtOYQuOWTinpSb2WT-ciLcdoxEDPdFEuG4lsm2n5WA2ekKX82M5qOaFeW_QHlwSIYEQuGo8PXp7iLTeOKamDCAlDTtWpp_fqjGUT_MyzLpj1alsSd7GpbdvhVUYaV0lWQAVlemtxsruxGdcA5nVOWhBOrk4yf2FqpfDUWENr9zRYLzJzsiqD6KnNeiQgQZinyk_148EhdWhco11xoeq-Qzj6pz3T7WOXaTiTP5FL1-nAyrGLs2oz_VsRdXVNZs55OD_t7WG_O3CGQpAN0jL7OT6Fa9r3CJqSEfhDtg-Blsqv4zUjGsuIrbJgtaTdxxk98C18cpw"

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
msg="Random message for testing"
boolPersonal="false"
secUsername=""
request="http --form POST http://localhost:8080/api/v1/logs/new msg='$msg' boolPersonal='$boolPersonal' secUsername='$secUsername' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request
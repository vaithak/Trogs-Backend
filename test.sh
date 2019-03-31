#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULlZ0RXpmYjZLeVRpTExQbnRzLUx5c1pZeGpnQmJhbXJSeEs4U1ZQSkV2dmciLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1NDA1ODk5MSwiZXhwIjoxNTU0MDYyNTkxLCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.WK1PjKyqMEYDGNYJb34aBoqWsFmc2mnoOIys3L3LyKQrVmnH6YCRGyUJHpGB0gTF2B7zkNCUkA6zPslIzEcb-_THO3Mx145TOlyVyi09cVDP2C1bIrrAgKfzLdDoMaYt15StKG5VDQl3UazFQfXW2v-sgbzlG0DUnJQWjh9ePAvoYScxmwzYX0ibliycamIkc_OKdDJITPuYAvL6bZ5fDgvMU933N1xpQ5dBnsjRfbZUZD6doMyiJZnbOinJhOn9y8yIPSz5t2mva1by8xAr5YvOUqnh2q_DdLL_zVGg23_xfn8oX3KAgyje19rWBiX9SN4dEuwuONhYG4d0xJHSzA"

# Get user dashboard data
request="http get http://localhost:8080/api/v1/user/ 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

# # Search existing user
# request="http get http://localhost:8080/api/v1/user/searchuser?uname=vaibhav.thakkar.22.12.99@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Search non-existing user
# request="http get http://localhost:8080/api/v1/user/searchuser?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Add non existing user as friend
# request="http get http://localhost:8080/api/v1/user/addfriend?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Add existing user as friend
# request="http get http://localhost:8080/api/v1/user/addfriend?uname=anand44tanmay@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# Adding new log
msg="Message for testing hey are you there thihhghgs is agin done."
boolPersonal="false"
secUsername=""
request="http --form POST http://localhost:8080/api/v1/logs/new msg='$msg' boolPersonal='$boolPersonal' secUsername='$secUsername' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

searchkr="Message"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="message"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="Mes"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

uniqRefId='e108efbbdfe6d131bcb8532224f3ea897fbf5e44c9662bdaa6010844'
request="http http://localhost:8080/api/v1/logs/delete?id='$uniqRefId' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

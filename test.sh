#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULko3V2V5MGNlak5QZldOWlIwYUc0NVdMenNjTTFXekJVUkdZaGN1eWV4OGMiLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1NDA2MzUyMCwiZXhwIjoxNTU0MDY3MTIwLCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.C7zH9GUXuf8ykR_Ry2shRYqx0IA4FWeIOjqdlNx4Fx8mz87LIqwfzEiwE4R7bBccz0wAHxQRNmlRrTfR8WU9BeChXMNJ9tpmWUCyDxv08VzaVflV8iOf9HbRJsbHxM3dSQUSgAdjL_LV17_fjUktodPjOF0CMm-xj-X2dRC44HBe07NotVU7kejHwPKCcQG447QFXN8Z-l9Qv61-TtPHAdqNTnxQ2iKM8EhTHTluj0mqBzdu662Kh0trj4xI0EyvKeJ9Z8ydDroPNsZuuhKlr0K3w01nFl5Vv-xLeXnZNR-sby8Xwtg0811DGOU7jkwf87D2_ocUgdHWaKz1u21bKA"

# Get user dashboard data
request="http get http://localhost:8080/api/v1/user/ 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Search existing user
request="http get http://localhost:8080/api/v1/user/searchuser?uname=vaibhav.thakkar.22.12.99@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Search non-existing user
request="http get http://localhost:8080/api/v1/user/searchuser?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Add non existing user as friend
request="http get http://localhost:8080/api/v1/user/addfriend?uname=random_name 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

# # Add existing user as friend
request="http get http://localhost:8080/api/v1/user/addfriend?uname=anand44tanmay@gmail.com 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
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

uniqRefId='650278437561c8c80c35284919447f5cf76f5e80d3cada4aebcd9e05'
request="http http://localhost:8080/api/v1/logs/delete?id='$uniqRefId' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
# eval $request

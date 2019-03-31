#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnJ2amctWm4tdDYyTGIzSTVGaTJUejhXOWs1RjcwOFJoQlZhU1BRSTk4MXMiLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1NDA0MzcyNSwiZXhwIjoxNTU0MDQ3MzI1LCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbImVtYWlsIiwib3BlbmlkIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.T8sw2bbygmZBXBUx1v57fampnClydRG3nkf-qDfcSSyjNnSqsKdEnW5AtA3umLtWbqxrKtAgeIs_iQh2kDJP8mInFpyo8fIj9JnALDPELwlz2luxs1Up-HYDEx2gGpgzQBjrp9up2ZTYUEgh14P85sJHXLrxRvM32o06CtNd9n2fQtBSynri9bg2Svkm0D4cgG_J8IKxJUYMmn5gie7Eh8w1s49RQL6OrhVpXpZCTkfNmWFFRIS0etA4FQcHfx406-yLHoEXKXaALarSJn0k5NNyoVjuK8da-qAS43iu9Zk7tdyC4g49IxQrT_sD5kF1LKh7k5ztMlLEqFznT3hcAQ"

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

Adding new log
msg="Message for testing hey are you there thihhghgs is agin done."
boolPersonal="false"
secUsername=""
request="http --form POST http://localhost:8080/api/v1/logs/new msg='$msg' boolPersonal='$boolPersonal' secUsername='$secUsername' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="Message"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="mssge"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="message"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

searchkr="Mes"
request="http --form POST http://localhost:8080/api/v1/logs/search/ queryString='$searchkr' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

uniqRefId='5f0de22b17d79c6db7e4e894c469846b6d28ba2b5c75437492e7391b'
request="http http://localhost:8080/api/v1/logs/delete?id='$uniqRefId' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request

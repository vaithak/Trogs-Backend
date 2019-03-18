#!/bin/bash

# Replace this accessToken with refreshed one
accessToken="eyJraWQiOiJjcFF2WUpNaElhM1dBNFN2Zy1pSGdtdHJXRndVX2V1WHFsTVpsU3FWSXVrIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnN2LXNzbXhFOE5mUURRR2hhZWM0aVdWTm9Rd1ZCUXlINkVkS3BRYThfdlUiLCJpc3MiOiJodHRwczovL2Rldi03MTIzMjEub2t0YXByZXZpZXcuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTU1MjkxMTE0OSwiZXhwIjoxNTUyOTE0NzQ5LCJjaWQiOiIwb2FqcjdnazE3NUN6Q1dCcjBoNyIsInVpZCI6IjAwdWpxcDJmeHhwWWh5U3NBMGg3Iiwic2NwIjpbIm9wZW5pZCIsImVtYWlsIl0sInN1YiI6InZhaWJoYXYudGhha2thci4yMi4xMi45OUBnbWFpbC5jb20ifQ.lD3htT26bUyzRwcorwpVN-1eoYVQIuAWtmbFftgA4QDcfxYeJ3Ek8IwQbv0Q5GSiCL45Vjr30tR9bnIrdfz5qeao9b_OujqhtcFymCPBuxtkoGh9XTAmRdJdrdpcuFnMfFvAm6VtUec4Fqr7piV-Hc26YlNvBGHwXBH9vd6_rzA_iNQRoLxHuM4YWbLUXIpHisbAaSYISx38f5g9skM4Jix-piRCXdSHVl1zrK-1HVxhyYEA0ZlTxyvGhLZtYi6t6Nj5iiU-8g9zVbeu1kDVAhIM9kQBSfxS0XrdHULto_p4Q8045Xt-VbHZVPn54Q10NmDxtOYZhjjK6Vifj9PgDg"

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
msg="Testing log data"
request="http --form POST http://localhost:8080/api/v1/logs/new msg='$msg' 'Authorization: \"Bearer $accessToken\"' -v --ignore-stdin"
eval $request
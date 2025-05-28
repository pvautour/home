#!/bin/bash
if [ -n "$lambda_name" ]; then
  printf "\nLambda name is set to:\n"
  printf "\n$lambda_name"
else
  printf "\nPlase enter lambda name: "
  read lambda_name
fi

zip -r function.zip . -x "function.zip*"
aws lambda update-function-code --function-name $lambda_name --zip-file fileb://function.zip
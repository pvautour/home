#!/bin/bash
if [ -n "$lambda_name" ]; then
  printf "\nLambda name is set to:\n"
  printf "\n$lambda_name"
else
  printf "\nPlase enter lambda name: "
  read lambda_name
fi

if [ -n "$lambda_payload" ]; then
  printf "\nLambda payload is set to:\n"
  printf "\n$lambda_payload"
else
  printf "\nPlase enter lambda payload: "
  read lambda_payload
fi

aws lambda invoke --function-name $lambda_name out --output text --payload $lambda_payload --cli-binary-format raw-in-base64-out
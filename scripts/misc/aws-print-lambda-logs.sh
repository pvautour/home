#!/bin/bash
if [ -n "$lambda_name" ]; then
  printf "\nLambda name is set to:\n"
  printf "\n$lambda_name"
else
  printf "\nPlase enter lambda name: "
  read lambda_name
fi

aws logs tail "/aws/lambda/$lambda_name" --follow

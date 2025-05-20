#!/bin/bash
getBucketName() {
    aws s3 ls | fzf | awk -F ' ' '{print $3}'
  }
BUCKET_NAME=$(getBucketName)
echo $BUCKET_NAME
read -p "This will delete $BUCKET_NAME and all of it's content. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Operation canceled."
    exit 1
fi
aws s3 rm s3://$BUCKET_NAME --recursive
aws s3 rb s3://$BUCKET_NAME
echo "Bucket deleted."
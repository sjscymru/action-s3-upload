#!/usr/bin/env bash

if [[ $SINGLE_FILE == 'true' ]]
  then
    #Sync file with amazon s3 bucket app
    echo Synchronising file with S3...
    S3_CMD=cp
    S3_OBJECT_PATH=$INPUT_AWS_BUCKET_NAME$INPUT_BUCKET_PATH/$DIST_LOCATION_CODE
  else    
    #Sync folder with amazon s3 bucket app
    echo Synchronising folder with S3...
    S3_CMD=sync
    S3_OBJECT_PATH=$INPUT_AWS_BUCKET_NAME$INPUT_BUCKET_PATH
fi

# use AWS cli to do the work
aws --region $INPUT_AWS_DEFAULT_REGION s3 $S3_CMD $DIST_LOCATION_CODE s3://$S3_OBJECT_PATH --no-progress 

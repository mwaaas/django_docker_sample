#! /bin/bash

SHA1=$1
EB_BUCKET=elasticbeanstalk-eu-west-1-033845034954

# Deploy image to Docker Hub
docker push mwaaas/django-sample-app:$SHA1

# Create new Elastic Beanstalk version
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json
sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE
aws s3 cp $DOCKERRUN_FILE s3://$EB_BUCKET/$DOCKERRUN_FILE
aws elasticbeanstalk create-application-version --application-name django-docker-sample \
    --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$DOCKERRUN_FILE

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name sample-app-staging.elasticbeanstalk.com --version-label $SHA1
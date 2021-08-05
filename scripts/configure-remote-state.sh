#!/bin/bash
set -ex
AWS_REGION="us-east-1"
S3_BUCKET=`aws s3 ls --region $AWS_REGION |grep terraform-state |tail -n1 |cut -d ' ' -f3`
sed -i 's/terraform-state-xx70dpnh/'${S3_BUCKET}'/' backend.tf
sed -i 's/#//g' backend.tf
touch mykey
touch mykey.pub
terraform init
terraform apply -auto-approve -var MYAPP_SERVICE_ENABLE=1 -target aws_ecs_service.myapp-service
#!/bin/sh
imageName=$1
deployment=$1
if [ $2 ]
then
  imageName=$2
fi
digest=`gcloud -q container images describe gcr.io/city-7337/${imageName}:latest --format="json" | jq ".image_summary.fully_qualified_digest" -r`
echo $digest
kubectl set image deployment $deployment *=$digest
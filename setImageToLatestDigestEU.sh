#!/bin/sh
imageName=$1
deployment=$1
if [ $deployment = "entry" ]
then
  imageName="reflective-entry"
fi

if [ $2 ]
then
  imageName=$2
fi

if [ $deployment = "reconnect" ]
then
  imageName="re-connect"
fi

if [ $deployment = "registrations" ] || [ $deployment = "snapshots" ] || [ $deployment = "search" ] || [ $deployment = "processing" ]
then
  imageName="index"
fi

if [ $2 ]
then
  imageName=$2
fi

digest=`gcloud -q container images describe eu.gcr.io/city-7337/${imageName}:latest --format="json" | jq ".image_summary.fully_qualified_digest" -r`
echo $digest
kubectl set image deployment $deployment *=$digest
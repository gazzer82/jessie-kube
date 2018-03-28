# Build and push the image
#!/bin/bash
echo GCLOUD_PROJECT
echo '-n $GCLOUD_KEY | base64 -d > /gcloud_key.json'
cd /
gcloud auth activate-service-account --key-file=gcloud_key.json
gcloud container clusters get-credentials $GCLOUD_CLUSTER --zone $GCLOUD_ZONE --project $GCLOUD_PROJECT

kubectl set image deployment/$GCLOUD_DEPLOYMENT $GCLOUD_CONTAINER=$GCLOUD_IMAGE:$BUILDKITE_COMMIT

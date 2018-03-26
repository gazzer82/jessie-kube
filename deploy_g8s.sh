# Build and push the image
#!/bin/bash
gcloud auth activate-service-account --key-file=/base/kube/docker.json
gcloud container clusters get-credentials $GCLOUD_CLUSTER --zone $GCLOUD_ZONE --project $GCLOUD_PROJECT

kubectl set image deployment/$GCLOUD_DEPLOYMENT $GCLOUD_CONTAINER=$GCLOUD_IMAGE:$BUILDKITE_COMMIT

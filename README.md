# jessie-kube

By default it will send an update to a deployment when passed the correct env vars.

BUILDKITE_COMMIT - Whatever tag you want to update the deployment to
GCLOUD_ZONE - your gcloud zone
GCLOUD_PROJECT - your kubernetes project
GCLOUD_CLUSTER - your cluster name
GCLOUD_BASE_IMAGE - base image name without URL
GCLOUD_IMAGE - full image name including URL on GCS
GCLOUD_DEPLOYMENT - Kubernetes deployment name to update
GCLOUD_CONTAINER - The container within the deployment to update

It also expects a service account keyfile json format mounted as - /base/kube/docker.json

Execute it via docker-compose run passing in the correct variables and calling the command /bin/bash ./deploy_g8s.sh

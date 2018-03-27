# Build and push the image
#!/bin/bash
sed -i -e "s#{PROJECT_ID}#$GCLOUD_PROJECT#" gcloud_key.json
sed -i -e "s#{PRIVATE_KEY_ID}#$PRIVATE_KEY_ID#" gcloud_key.json
sed -i -e "s#{PRIVATE_KEY}#$PRIVATE_KEY#" gcloud_key.json
sed -i -e "s#{CLIENT_EMAIL}#$CLIENT_EMAIL#" gcloud_key.json
sed -i -e "s#{CLIENT_ID}#$CLIENT_ID#" gcloud_key.json
sed -i -e "s#{CERT_URL}#$CERT_URL#" gcloud_key.json
gcloud auth activate-service-account --key-file=gcloud_key.json
gcloud container clusters get-credentials $GCLOUD_CLUSTER --zone $GCLOUD_ZONE --project $GCLOUD_PROJECT

kubectl set image deployment/$GCLOUD_DEPLOYMENT $GCLOUD_CONTAINER=$GCLOUD_IMAGE:$BUILDKITE_COMMIT

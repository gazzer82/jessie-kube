# Build and push the image
#!/bin/bash
sed -e "s/\${PROJECT_ID}/$GCLOUD_PROJECT/" -e "s/\${PRIVATE_KEY_ID}/$PRIVATE_KEY_ID/" -e "s/\${PRIVATE_KEY}/$PRIVATE_KEY/" -e "s/\${CLIENT_EMAIL}/$CLIENT_EMAIL/" -e "s/\${CLIENT_ID}/$CLIENT_ID/" -e "s/\${CERT_URL}/$CERT_URL/" /base/gcloud_key.json
gcloud auth activate-service-account --key-file=/base/gcloud_key.json
gcloud container clusters get-credentials $GCLOUD_CLUSTER --zone $GCLOUD_ZONE --project $GCLOUD_PROJECT

kubectl set image deployment/$GCLOUD_DEPLOYMENT $GCLOUD_CONTAINER=$GCLOUD_IMAGE:$BUILDKITE_COMMIT

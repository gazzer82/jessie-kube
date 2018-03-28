##Node image
FROM debian:jessie

##Change to working directory
WORKDIR /

RUN apt-get update && apt-get install -y curl

RUN export CLOUD_SDK_REPO="cloud-sdk-$(echo jessie)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

RUN apt-get install -y kubectl

##Copy Deploy Script
COPY ./deploy_g8s.sh /deploy_g8s.sh

## Make deploy script executable
RUN chmod +x /deploy_g8s.sh

ENTRYPOINT ["/bin/bash", "./deploy_g8s.sh"]

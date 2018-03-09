FROM alpine:latest
RUN apk --update add \
    ca-certificates make curl python2 && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# gcloud
ADD https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-192.0.0-linux-x86_64.tar.gz gcloud-sdk.tar.gz
RUN tar -xzf gcloud-sdk.tar.gz
RUN rm gcloud-sdk.tar.gz
RUN ./google-cloud-sdk/install.sh
ENV PATH="/google-cloud-sdk/bin:${PATH}"

FROM docker:17.05.0-ce-git

ENV GCLOUD_SDK_VERSION=174.0.0

RUN apk update && apk add --no-cache \
  wget \
  python \
  curl \
  curl-dev

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN mkdir -p /usr/local/gcloud
RUN tar -C /usr/local/gcloud -xvf google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN /usr/local/gcloud/google-cloud-sdk/install.sh -q
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
RUN gcloud --help
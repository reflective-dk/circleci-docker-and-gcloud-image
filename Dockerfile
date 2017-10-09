FROM docker:17.05.0-ce-git

ENV GCLOUD_SDK_VERSION=167.0.0

RUN apk update && apk add --no-cache \
  wget \
  python \
  curl \
  curl-dev

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN tar zxf google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh -q
RUN mv ./google-cloud-sdk/bin/gcloud /usr/bin/gcloud
RUN chmod a+rwx /usr/bin/gcloud
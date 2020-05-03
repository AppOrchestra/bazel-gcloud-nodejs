FROM apporchestra/nodejs-cloud-sdk-docker

# Install Bazel as per https://docs.bazel.build/versions/master/install-ubuntu.html#install-on-ubuntu
# The base apporchestra/nodejs-cloud-sdk-docker image is based on debian buster which should be ok instead of Ubuntu
# Do the one-time setup step as one RUN command so it can be cached separately from the bazel package install
RUN apt install curl && \
        curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
        echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
# Install Bazel
RUN apt update && apt install bazel && rm -rf /var/lib/apt/lists/*

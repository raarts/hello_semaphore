FROM ubuntu

RUN apt-get update && \
    apt-get install libssl1.0.0 && \
    apt-get autoclean

RUN mkdir -p /app
ARG VERSION=0.0.1
COPY rel/hello_semaphore/releases/${VERSION}/hello_semaphore.tar.gz /app/hello_semaphore.tar.gz
WORKDIR /app
RUN tar xvzf hello_semaphore.tar.gz
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PORT 8888
ENTRYPOINT /app/bin/hello_semaphore foreground

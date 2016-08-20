FROM p711/phoenix-framework

COPY scripts/wait-for-postgres.sh /app/wait-for-postgres.sh

RUN mkdir -p /app/build
ARG VERSION=0.0.1
ENV MIX_ENV prod
WORKDIR /app/build

# copy sourcetree to image before build
COPY . /app/build

# remove any left over builds and dependancies, do the build and remove what we don't need.
RUN rm -rf _build deps rel && \
  mix deps.get && \
  mix compile && \
  mix release && \
  tar xzvf rel/hello_semaphore/releases/${VERSION}/hello_semaphore.tar.gz -C /app && \
  cd /app && rm -rf build

WORKDIR /app

ENV PORT 8888
CMD ["/app/bin/hello_semaphore", "foreground"]

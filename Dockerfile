FROM p711/phoenix-framework

RUN apt-get update && \
    apt-get install -y libssl1.0.0 postgresql-client locales && \
    apt-get autoclean

# elixir requires locale UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

COPY scripts/wait-for-postgres.sh /app/wait-for-postgres.sh

RUN mkdir -p /app/build
ARG VERSION=0.0.1
ENV MIX_ENV prod
WORKDIR /app/build

COPY . /app/build
RUN env
RUN locale
RUN mix deps.get
RUN mix compile
RUN mix release
WORKDIR /app
RUN mv build/rel/hello_semaphore/releases/${VERSION}/hello_semaphore.tar.gz .
#RUN rm -rf build
RUN tar xvzf hello_semaphore.tar.gz
ENV PORT 8888
CMD ["/app/bin/hello_semaphore", "foreground"]

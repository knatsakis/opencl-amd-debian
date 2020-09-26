# To build this Docker image:
#   docker build --build-arg=VERSION="1.11.0" -t fpm:1.11.0 .
#
# To run fpm via Docker:
#   alias fpm='docker run --user=$(id -u) --rm --mount type=bind,source="$(pwd)",target=/app -it fpm:1.11.0'
#
FROM debian:bullseye-slim

ARG VERSION=1.11.0

RUN apt-get update && \
      apt-get install -y ruby ruby-dev rubygems build-essential

RUN gem install --no-document fpm -v $VERSION

VOLUME /app
WORKDIR /app
ENTRYPOINT ["fpm"]
FROM ubuntu:latest

WORKDIR /mac/source
RUN apt-get update && apt-get -y install gcc
COPY ./.bash_aliases /root/.bash_aliases
COPY ./bin/* /usr/bin/

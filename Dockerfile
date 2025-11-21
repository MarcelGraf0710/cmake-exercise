FROM ubuntu:24.04

RUN mkdir yaml
COPY yaml.sh /yaml/yaml.sh

RUN apt-get update && apt-get install -y build-essential cmake libdeal.ii-dev libboost-all-dev wget
RUN ./yaml/yaml.sh
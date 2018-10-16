FROM golang
MAINTAINER ruiwang14

RUN git clone https://github.com/prometheus/client_golang.git
WORKDIR client_golang/examples/random
RUN go get -d
RUN go build
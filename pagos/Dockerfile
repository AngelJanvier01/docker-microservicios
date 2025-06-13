FROM golang:1.18

WORKDIR /go/src/pagos

COPY . .

RUN go env -w GO111MODULE=off

RUN go get -d

RUN go build -o /go/bin/pagos

EXPOSE 8003

ENTRYPOINT ["/go/bin/pagos"]
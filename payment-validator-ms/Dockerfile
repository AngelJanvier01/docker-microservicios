FROM golang:1.18

WORKDIR /go/src/payment-validator-ms

COPY . .

RUN go env -w GO111MODULE=off
RUN go get -d
RUN go build -o /go/bin/payment-validator-ms

EXPOSE 8004

ENTRYPOINT ["/go/bin/payment-validator-ms"]

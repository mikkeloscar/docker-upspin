# builder image
FROM golang:alpine as builder

RUN apk add --update git && go get upspin.io/cmd/...

# final image
FROM alpine
MAINTAINER Mikkel Oscar Lyderik Larsen <m@moscar.net>

COPY --from=builder /go/bin/* /usr/bin/

ENTRYPOINT ["/usr/bin/upspin"]

# builder image
FROM golang as builder

RUN go get upspin.io/cmd/...

# final image
FROM alpine
MAINTAINER Mikkel Oscar Lyderik Larsen <m@moscar.net>

COPY --from=builder /go/bin/* /usr/bin/

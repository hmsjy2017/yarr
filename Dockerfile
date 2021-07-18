FROM golang:alpine AS build
RUN apk update && apk add build-base git
WORKDIR /src
COPY . .
RUN mkdir -p _output/linux
RUN	GOOS=linux GOARCH=amd64 go build -tags "sqlite_foreign_keys release linux" -ldflags="$(GO_LDFLAGS)" -o _output/linux/yarr src/main.go

FROM alpine:latest
RUN apk update && apk add --no-cache ca-certificates && \
    update-ca-certificates
COPY --from=build /src/_output/linux/yarr /usr/local/bin/yarr
EXPOSE 7070
CMD ["/usr/local/bin/yarr", "-addr", "0.0.0.0:7070", "-db", "/data/yarr.db"]

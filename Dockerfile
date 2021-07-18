FROM alpine:latest
WORKDIR /root/yarr
RUN apk update && \
    apk add --no-cache ca-certificates && \
    update-ca-certificates
COPY ./yarr /usr/local/bin/yarr
EXPOSE 7070
CMD ["/root/yarr", "-addr", "0.0.0.0:7070"]

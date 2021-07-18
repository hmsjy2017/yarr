FROM alpine:latest
WORKDIR /root/yarr
RUN apk update && \
    add --no-cache ca-certificates && \
    update-ca-certificates
COPY ./yarr /usr/local/bin/yarr
RUN chmod +x ./yarr
EXPOSE 7070
CMD ["/usr/local/bin/yarr", "-addr", "0.0.0.0:7070", "-db", "/data/yarr.db"]

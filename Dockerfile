FROM alpine:latest
RUN apk update
RUN apk add --no-cache ca-certificates && \
    update-ca-certificates
RUN wget https://github.com/nkanaev/yarr/releases/download/v2.0/yarr-v2.0-linux64.zip && unzip yarr-v2.0-linux64.zip
COPY /yarr /usr/local/bin/yarr
EXPOSE 7070
CMD ["/usr/local/bin/yarr", "-addr", "0.0.0.0:7070", "-db", "/data/yarr.db"]

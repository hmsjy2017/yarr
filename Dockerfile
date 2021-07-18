FROM alpine:latest
WORKDIR /root/yarr
ADD yarr ./yarr
RUN chmod +x ./yarr
CMD ./yarr
EXPOSE 7070

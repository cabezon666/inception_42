FROM alpine:3.21.4

RUN apk update && apk add --no-cache nginx

COPY tools/nginx-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/nginx-entrypoint.sh

RUN mkdir -p /usr/share/nginx/html
COPY rocketProject/ /usr/share/nginx/html/

EXPOSE 80

ENTRYPOINT [ "nginx-entrypoint.sh" ]

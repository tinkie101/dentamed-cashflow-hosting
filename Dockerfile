FROM openresty/openresty:alpine-fat

RUN mkdir /var/log/nginx

RUN apk add --no-cache openssl-dev
RUN apk add --no-cache git
RUN apk add --no-cache gcc

RUN apk add --no-cache openssl

RUN luarocks install lua-resty-openidc
RUN luarocks install lua-resty-auto-ssl
RUN mkdir /etc/resty-auto-ssl \
  && addgroup -S nginx \
  && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
  && chown nginx /etc/resty-auto-ssl

RUN openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
      -subj '/CN=sni-support-required-for-valid-ssl' \
      -keyout /etc/ssl/resty-auto-ssl-fallback.key \
      -out /etc/ssl/resty-auto-ssl-fallback.crt

RUN cp /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.pem

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
EXPOSE 443

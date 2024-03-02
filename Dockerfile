FROM caddy:builder-alpine AS builder-alpine

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/rfc2136 \
    --with github.com/caddyserver/caddy/v2

FROM caddy:alpine

COPY --from=builder-alpine /usr/bin/caddy /usr/bin/caddy

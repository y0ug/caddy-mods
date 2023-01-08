FROM caddy:2.6-builder-alpine AS builder-alpine

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.6-alpine

COPY --from=builder-alpine /usr/bin/caddy /usr/bin/caddy

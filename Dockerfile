FROM caddy:2-builder-alpine AS builder-alpine

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2-alpine

COPY --from=builder-alpine /usr/bin/caddy /usr/bin/caddy

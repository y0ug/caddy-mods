FROM caddy:2.6-builder-alpine AS builder-alpine

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/rfc2136 \
    --with github.com/caddyserver/caddy/v2=github.com/caddyserver/caddy/v2@v2.6.4

FROM caddy:2.6-alpine

COPY --from=builder-alpine /usr/bin/caddy /usr/bin/caddy

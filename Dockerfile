# Inkboard: a static web app served by nginx.
FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Inkboard" \
      org.opencontainers.image.description="PDF viewer with laser pointer, pen and highlighter for screen recording and teaching" \
      org.opencontainers.image.version="1.1.0" \
      org.opencontainers.image.source="https://github.com/bhavukbhardwaj/inkboard" \
      org.opencontainers.image.licenses="MIT"

COPY --chmod=644 index.html /usr/share/nginx/html/index.html
COPY --chmod=755 vendor /usr/share/nginx/html/vendor
RUN find /usr/share/nginx/html/vendor -type f -exec chmod 644 {} +

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ >/dev/null || exit 1

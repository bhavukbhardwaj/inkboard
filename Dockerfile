# Inkboard: a static web app served by nginx.
FROM nginx:1.27-alpine

COPY --chmod=644 index.html /usr/share/nginx/html/index.html
COPY --chmod=755 vendor /usr/share/nginx/html/vendor
RUN find /usr/share/nginx/html/vendor -type f -exec chmod 644 {} +

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ >/dev/null || exit 1

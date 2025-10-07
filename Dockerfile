FROM ghcr.io/n8n-io/n8n:1.113.3

USER root
# Install ffmpeg whether the base image uses apt-get (Debian/Ubuntu) or apk (Alpine)
RUN set -eux; \
  if command -v apt-get >/dev/null 2>&1; then \
    apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*; \
  elif command -v apk >/dev/null 2>&1; then \
    apk add --no-cache ffmpeg; \
  else \
    echo "No known package manager found (expected apt-get or apk)"; exit 1; \
  fi

# drop back to the default non-root user
USER node


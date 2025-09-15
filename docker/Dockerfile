FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# 2.1) Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    steghide chafa python3 \
    wget ca-certificates \
    unzip less && \
    rm -rf /var/lib/apt/lists/*

# 2.2) Create student user
RUN useradd -m -s /bin/bash student

# 2.3) Image HTTP preview helper: `serve-files [PORT] [DIR]`  → serves DIR (default: $PWD)
RUN install -d -m 0755 /usr/local/bin && \
    printf '%s\n' \
      '#!/usr/bin/env bash' \
      'set -e' \
      'PORT=8080' \
      'DIR="${1:-$PWD}"' \
      'echo "[LAB] Serving $DIR at http://localhost:${PORT}"' \
      'exec python3 -m http.server "${PORT}" --bind 0.0.0.0 --directory "${DIR}"' \
      > /usr/local/bin/serve-files && chmod +x /usr/local/bin/serve-files
EXPOSE 8080

# 2.4) Switch to student user
USER student
WORKDIR /home/student

# 2.5) Preload lab files
COPY --chown=student:student docker/images/* /home/student/

# 2.6) Set up entrypoint script
COPY --chmod=755 docker/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]

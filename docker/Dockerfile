FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# 2.1) Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    steghide chafa python3 \
    wget ca-certificates \
    unzip less exiftool && \
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

# 2.4) Minimal checker: prints CORRECT/INCORRECT for steganography challenge
RUN install -d -m 0755 /usr/local/bin && \
    printf '%s\n' \
'#!/usr/bin/env bash' \
'set -Eeuo pipefail' \
'FILE="/home/student/08_H.jpg"' \
'PASS="NEON"' \
'if [[ ! -f "$FILE" ]]; then echo "INCORRECT"; exit 1; fi' \
'out="$(/usr/bin/steghide info "$FILE" -p "$PASS" 2>&1 || true)"' \
'if echo "$out" | grep -qi "embedded file"; then echo -e "\033[0;32mCORRECT\033[0m: Message encoded successfully. You win!"; exit 0; fi' \
'echo -e "\033[0;31mINCORRECT\033[0m: No embedded file found."; exit 1' \
    > /usr/local/bin/check-answer && \
    chmod +x /usr/local/bin/check-answer

# 2.5) Switch to student user
USER student
WORKDIR /home/student

# 2.6) Preload lab files
COPY --chown=student:student docker/part3/* /home/student/

# 2.7) Set up entrypoint script
COPY --chmod=755 docker/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]

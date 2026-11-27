FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# 2.1) Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    steghide chafa python3 \
    wget ca-certificates \
    unzip less exiftool sudo && \
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

# 2.4) Answer checker. The real check (target image + password) lives in a
# root-only script the student runs through `sudo`, so it cannot be read from
# inside the container with `cat`, and it is COPYed (not inlined in a RUN) so it
# does not appear in `docker history`. Keep this lab repo PRIVATE: the public
# image still lets `docker run --user root` read it, which is an accepted limit.
COPY docker/check-answer-root /opt/lab/check-answer-root
RUN chown root:root /opt/lab/check-answer-root && \
    chmod 700 /opt/lab/check-answer-root && \
    install -d -m 0755 /usr/local/bin && \
    printf '%s\n' \
      '#!/usr/bin/env bash' \
      'exec sudo -n /opt/lab/check-answer-root' \
      > /usr/local/bin/check-answer && \
    chmod 0755 /usr/local/bin/check-answer && \
    printf '%s\n' 'student ALL=(root) NOPASSWD: /opt/lab/check-answer-root' \
      > /etc/sudoers.d/check-answer && \
    chmod 0440 /etc/sudoers.d/check-answer

# 2.5) Switch to student user
USER student
WORKDIR /home/student

# 2.6) Preload lab files
COPY --chown=student:student docker/part3/* /home/student/

# 2.7) Set up entrypoint script
COPY --chmod=755 docker/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]

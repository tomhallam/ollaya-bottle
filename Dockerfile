# Cloud in a Bottle wrapper around Ollaya's official CPU image.
FROM ghcr.io/ollaya-dev/ollaya:0.7.2

# Bottle's data dirs are idmapped so container-root owns them; the image's uid 1000 can't write
# them. Container-root is an unprivileged subuid on the host under rootless podman.
USER 0

ENV OLLAYA_HOST=0.0.0.0:11435 \
    OLLAYA_DEVICE=cpu \
    OLLAYA_MAX_LOADED_MODELS=1

# Keep model weights in the archive tier: they are re-downloadable, so they stay out of backups.
ENTRYPOINT ["/bin/sh", "-c", "export OLLAYA_MODELS=\"${BOTTLE_APP_ARCHIVE_DIR:-/home/ollaya/.ollaya}/models\"; mkdir -p \"$OLLAYA_MODELS\"; exec /usr/bin/ollaya serve"]
CMD []

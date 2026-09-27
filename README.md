# ollaya-bottle

Packages [Ollaya](https://github.com/ollaya-dev/ollaya) as a [Cloud in a Bottle](https://github.com/cloud-in-a-bottle/cloud-in-a-bottle) app, using the official CPU image `ghcr.io/ollaya-dev/ollaya`.

```sh
bottle app deploy https://github.com/tomhallam/ollaya-bottle --name ollaya --wait
```

- Runs on CPU with one model loaded at a time (`OLLAYA_MAX_LOADED_MODELS=1`), in 4 GB of memory.
- Model weights live in the archive tier (`BOTTLE_APP_ARCHIVE_DIR/models`). They are excluded from backups and can be downloaded again.
- No public paths. Every request needs the owner's login or a Cloud in a Bottle API token:

```sh
export TYPESAFE_BASE_URL=https://ollaya.<zone-domain>
export TYPESAFE_API_KEY=<Cloud in a Bottle API token>
```

Pull a model before first use:

```sh
bottle curl -X POST https://ollaya.<zone-domain>/api/pull -d '{"model":"laya:en"}'
```

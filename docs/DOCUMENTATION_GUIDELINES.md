# Module Documentation Guidelines

This document defines the documentation standard for SIGHUP Distribution (SD) modules.
`module-aws` is the **reference implementation** of this standard; the goal is to replicate it
across all `module-*` repositories.

The rationale: module documentation is published on [docs.sighup.io](https://docs.sighup.io),
so it must be **user-facing**. It must not expose implementation internals, and it must not
describe deprecated workflows.

## Documentation markers

Every README that contributes to the public documentation uses HTML comment markers:

- `<!-- <SD-DOCS> -->` … `<!-- </SD-DOCS> -->` delimits the content published to docs.sighup.io.
- `<!-- <FOOTER> -->` … `<!-- </FOOTER> -->` delimits GitHub-only content (Contributing, License).

Only the content **inside** the `SD-DOCS` block is user-facing. Treat everything in it as if a
distribution user — not a module maintainer — were reading it on the website.

## Rules for the `SD-DOCS` block

1. **No legacy workflows.** Do not document the `Furyfile.yml` + `furyctl legacy vendor` flow.
   That path lives only in `furyctl`'s isolated `legacy/` package and must not appear in
   user-facing docs.

2. **No internals.** Do not expose implementation details such as:
   - manual `kustomize` patches (`patchesStrategicMerge`, `sa-patch.yaml`, …)
   - raw `ServiceAccount` / `Deployment` YAML
   - container names, environment variable names
   - `./vendor/...` paths or per-version overlay paths (e.g. `{v1.29.x,v1.30.x,...}`)
   - image registry coordinates and tags

3. **Standard "Usage" section.** Explain that the module is deployed automatically as part of SD
   via `furyctl`, and that configuration is optional. Provide a minimal `furyctl.yaml` example of
   the relevant `spec.distribution.modules.<module>` block, then link to:
   - the configuration schema reference on the site
     (e.g. `https://docs.sighup.io/docs/reference/<kind>#specdistributionmodules<module>`)
   - the getting-started guide for the relevant provider
     (e.g. `https://docs.sighup.io/docs/getting-started/distro-on-eks`)

4. **Katalog package READMEs are user-facing too.** `katalog/*/README.md` files are inside
   `SD-DOCS`. Keep them to: a short overview, the upstream project link, user-level
   compatibility, and a pointer to how the package is configured via `furyctl.yaml` / the module
   README. Do not include deployment internals.

## What stays out of `SD-DOCS` (maintainer/dev docs)

These are not published and may keep implementation detail:

- `katalog/*/MAINTENANCE.md` — how packages are rebuilt from upstream.
- `modules/*/README.md` — Terraform module references (terraform-docs output).
- `examples/` — working examples for contributors.

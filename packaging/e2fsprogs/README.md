# e2fsprogs / resize2fs build recipe

These files are the complete Bazel build definitions used to produce the
statically linked (musl) `resize2fs` binary bundled in the Runloop guest
initrd. They are verbatim copies of the definitions used in Runloop's build
tree.

- `e2fsprogs.bzl` — Bazel module extension that fetches the e2fsprogs source
  archive.
- `BUILD.e2fsprogs.bazel` — the build file applied to that archive
  (`configure_make` rules for `mke2fs` and the static `resize2fs`).
- `resize2fs.BUILD` — the rule that renames the built binary to the bare
  `resize2fs` placed in the initrd.

## Source

e2fsprogs 1.47.4, unmodified upstream, fetched from
<https://github.com/tytso/e2fsprogs> tag `v1.47.4`:

- URL: `https://github.com/tytso/e2fsprogs/archive/refs/tags/v1.47.4.tar.gz`
- SHA-256: `9f82eaa7002673291629077b80ee005cadfcd49854907a22007fed70b0ef596e`

No patches are applied; the build configures upstream sources with the options
listed in `BUILD.e2fsprogs.bazel` and links statically against musl.

## Licenses

`resize2fs` is licensed GPL-2.0; `libext2fs` (linked into it) is LGPL-2.0.
See the `NOTICE` and library `COPYING` files in the upstream e2fsprogs
distribution for the authoritative license texts.

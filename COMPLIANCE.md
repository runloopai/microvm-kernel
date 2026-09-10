# License compliance

This repository is the complete corresponding source, in the sense of GPLv2
section 3, for the Runloop microVM kernel binaries. A shipped kernel binary is
built from:

- the upstream Linux kernel source from <https://www.kernel.org/> (release per
  the kernel version recorded in `versions.yaml` and the build workflow), plus
- the patches in `packaging/kernel/patches/`,
- the kernel config fragments in `packaging/kernel/configs/`, and
- the build scripts in this repository (`packaging/kernel/build-kernel.sh` and
  `packaging/scripts/`).

Each kernel artifact name contains the seven-character prefix of its source
commit. New artifacts also contain a `SOURCE_PROVENANCE` file beside `vmlinux`
that records the artifact name, the full source commit, architecture, build
flavor, source repository, and workflow run. The full commit is authoritative;
the abbreviated hash in the filename is only for readability.

## Artifacts predating embedded provenance

The following shipped artifacts predate `SOURCE_PROVENANCE`. Their SHA-256
checksums identify the binaries, and successful [workflow run
27325651087](https://github.com/runloopai/microvm-kernel/actions/runs/27325651087)
maps all four builds to full source commit
[`186e48bece2f20747265ecaa2a13fdeb4445f9b2`](https://github.com/runloopai/microvm-kernel/commit/186e48bece2f20747265ecaa2a13fdeb4445f9b2).

| Artifact | SHA-256 |
|---|---|
| `linux-6.18.32-runloop-20260611-186e48b-x86_64.tar.gz` | `a75f8ad56327e103858fb7530215930f4983d530d14a362cbabc4f350604c3aa` |
| `linux-6.18.32-runloop-20260611-186e48b-x86_64-ebpf.tar.gz` | `ff7b967228eb112a09c492592c86cab0d0af455219461e4a1a23fc7eda2c96d9` |
| `linux-6.18.32-runloop-20260611-186e48b-arm64.tar.gz` | `4bed56ba93e0e98a524fe9e8c0658f8bdb850943055966f8facffadacc2bd3e7` |
| `linux-6.18.32-runloop-20260611-186e48b-arm64-ebpf.tar.gz` | `adb646ecb660138314167b9725a5f45fda35ff67f934980258b3e55e696cb359` |

## Licenses

- The Linux kernel is GPL-2.0-only; the `COPYING` file in the upstream kernel
  tarball governs. The patches in `packaging/kernel/patches/` modify the
  kernel and are likewise GPL-2.0.
- The build scripts and config fragments are derived from Kata Containers
  packaging and are Apache-2.0; their copyright and SPDX notices are retained.
  The top-level `LICENSE` file (Apache-2.0) covers this repository's own build
  tooling.
- The e2fsprogs build recipe in `packaging/e2fsprogs/` is the complete build
  definition for the statically linked `resize2fs` bundled in the Runloop
  guest initrd (GPL-2.0, with LGPL-2.0 `libext2fs`); see the README in that
  directory for the exact upstream source and checksum.

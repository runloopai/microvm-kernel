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

Every kernel artifact build pushes a git tag named after the artifact tarball
(sans extension), so each shipped binary maps to the exact commit of this
repository — and thereby the exact patches, config, and scripts — used to
build it.

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

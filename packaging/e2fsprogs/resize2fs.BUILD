# Statically-linked `resize2fs` (hermetic e2fsprogs build) bundled into the guest
# initrd. vmagent execs it to grow the rootfs offline before mount, since the
# image's ext4 uses `sparse_super2` (the kernel's online resize path refuses it).
#
# The binary is cross-compiled to the target guest platform (Linux musl
# arm64/x86_64) — see `@e2fsprogs//:resize2fs`. Renamed to the bare `resize2fs`
# (the initrd's ext4_image places files by basename → /resize2fs) with the
# executable bit set.
genrule(
    name = "resize2fs_bin",
    srcs = ["@e2fsprogs//:resize2fs"],
    outs = ["resize2fs"],
    cmd = "cp $< $@ && chmod +x $@",
    visibility = ["//visibility:public"],
)

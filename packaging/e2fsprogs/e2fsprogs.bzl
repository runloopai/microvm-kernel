"""Module extension for e2fsprogs (mke2fs) built from source.

This module provides a hermetic build of mke2fs from the e2fsprogs source code,
eliminating the need for system-installed e2fsprogs.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# e2fsprogs version
_E2FSPROGS_VERSION = "1.47.4"
_E2FSPROGS_SHA256 = "9f82eaa7002673291629077b80ee005cadfcd49854907a22007fed70b0ef596e"

def _e2fsprogs_extension_impl(module_ctx):
    """Module extension implementation for e2fsprogs."""
    http_archive(
        name = "e2fsprogs",
        build_file = Label("//:bzl/BUILD.e2fsprogs.bazel"),
        sha256 = _E2FSPROGS_SHA256,
        strip_prefix = "e2fsprogs-" + _E2FSPROGS_VERSION,
        urls = [
            "https://github.com/tytso/e2fsprogs/archive/refs/tags/v{}.tar.gz".format(_E2FSPROGS_VERSION),
        ],
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = ["e2fsprogs"],
        root_module_direct_dev_deps = [],
    )

e2fsprogs = module_extension(
    implementation = _e2fsprogs_extension_impl,
    doc = "Module extension for building e2fsprogs from source.",
)

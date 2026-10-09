#!/usr/bin/env bash
# Validate the resolved config, including symbols selected by other options.
set -euo pipefail
config=${1:?Usage: verify-storage-config.sh path/to/.config}
[[ -f "$config" ]] || { echo "Missing kernel config: $config" >&2; exit 1; }

for symbol in PCI PCI_MSI VIRTIO_PCI VIRTIO_BLK EXT4_FS OVERLAY_FS FUSE_FS TMPFS DEVTMPFS \
    LIBNVDIMM BLK_DEV_PMEM VIRTIO_PMEM DAX FS_DAX; do
    if ! grep -qx "CONFIG_${symbol}=y" "$config"; then
        echo "Required built-in option missing: CONFIG_${symbol}=y" >&2
        exit 1
    fi
done

for symbol in SCSI SCSI_VIRTIO BLK_DEV_SD BLK_DEV_BSG TARGET_CORE TCM_USER2 \
    LOOPBACK_TARGET UIO VFIO VFIO_PCI IOMMU_SUPPORT INTEL_IOMMU VIRTIO_IOMMU \
    XFS_FS EROFS_FS VIRTIO_FS NET_9P 9P_FS \
    NETWORK_FILESYSTEMS; do
    if grep -Eq "^CONFIG_${symbol}=[ym]$" "$config"; then
        echo "Unexpected storage/passthrough option: CONFIG_${symbol}" >&2
        exit 1
    fi
done

echo "Storage configuration verified: virtio-blk/PCI, PMEM/DAX, ext4, overlayfs and FUSE"

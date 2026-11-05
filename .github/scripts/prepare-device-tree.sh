#!/usr/bin/env bash
set -euo pipefail

DEVICE_DIR="${1:?usage: prepare-device-tree.sh <device-tree-path>}"
cd "$DEVICE_DIR"

test -f omni_J706F.mk
test -f AndroidProducts.mk
test -f BoardConfig.mk

cp omni_J706F.mk twrp_J706F.mk
sed -i 's#vendor/omni/config/common.mk#vendor/twrp/config/common.mk#' twrp_J706F.mk
sed -i 's/PRODUCT_NAME := omni_J706F/PRODUCT_NAME := twrp_J706F/' twrp_J706F.mk

cat > AndroidProducts.mk <<'EOF'
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_J706F.mk

COMMON_LUNCH_CHOICES := \
    twrp_J706F-eng
EOF

grep -q 'vendor/twrp/config/common.mk' twrp_J706F.mk
grep -q 'PRODUCT_NAME := twrp_J706F' twrp_J706F.mk
grep -q 'twrp_J706F-eng' AndroidProducts.mk
echo "Prepared J706F device tree for TWRP AOSP manifest."

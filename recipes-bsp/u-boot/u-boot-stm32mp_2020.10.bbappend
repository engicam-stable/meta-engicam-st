FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-initial-support-icore.patch \
            file://0002-Added-support-for-starterkit-lvds-display.patch \
            file://0003-Initial-support-for-icore-with-openframe.patch \
            file://0004-Added-fmc-node-for-NAND-flash-aligned-with-kernel-us.patch \
            "

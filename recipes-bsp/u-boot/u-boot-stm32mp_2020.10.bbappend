FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-initial-support-icore.patch \
            file://0002-Added-support-for-starterkit-lvds-display.patch \
            file://0003-Initial-support-for-icore-with-openframe.patch \
            file://0004-Added-fmc-node-for-NAND-flash-aligned-with-kernel-us.patch \
            file://0005-ctouch-added-nand-flash-node.patch \
            file://0006-Enabled-ethernet-and-usb-in-u-boot-for-icore.patch \
            file://0007-Ported-stm32mp157d-800-MHz-on-Engicam-starterkit.patch \
            "

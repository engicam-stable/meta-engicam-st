FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-initial-support-for-icore-edimm-2.0.patch \
            file://0002-Added-sn65dsi83-driver-for-starterkit-lvds-display.patch \
            file://0003-Added-YES7-touchscreen-support-for-starterkit.patch \
            file://0004-Initial-support-for-icore-ctouch2-with-Ampire10-disp.patch \
            file://0005-starterkit-Added-NAND-flash-device-tree-node.patch \
            file://0006-ctouch-Added-nand-flash-device-tree-node.patch \
            file://0007-Ported-stm32mp157d-800-MHz-on-Engicam-starterkit.patch \
            file://0008-Fix-Set-sgtl5000-as-master-of-SAI2B-for-FS-and-SCK-c.patch \
            "

KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-06.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"
SRC_URI_class-devupstream += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"

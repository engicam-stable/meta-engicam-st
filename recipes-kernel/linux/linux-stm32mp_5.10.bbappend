FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-initial-support-for-icore-edimm-2.0.patch \
            file://0002-Added-sn65dsi83-driver-for-starterkit-lvds-display.patch \
            file://0003-Added-YES7-touchscreen-support-for-starterkit.patch \
            file://0004-Initial-support-for-icore-ctouch2-with-Ampire10-disp.patch \
            file://0005-Added-NAND-flash-device-tree-node.patch \
            "

KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-06.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"
SRC_URI_class-devupstream += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"

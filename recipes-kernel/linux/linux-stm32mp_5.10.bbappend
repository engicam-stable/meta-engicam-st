FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-add-edt-ft5x26-touch-screen-driver.patch \
            file://0002-initial-support-ugea.patch \
            file://0003-add-RS232-support-ttySTM1.patch \
            file://0004-add-nand-flash-layout.patch \
            file://0005-Added-rs485-support.patch \
            file://0006-Enabled-M4-remote-processor-for-microgea.patch \
            "

KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-06.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"
SRC_URI_class-devupstream += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"

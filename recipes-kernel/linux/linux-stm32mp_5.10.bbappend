FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-add-edt-ft5x26-touch-screen-driver.patch \
            file://0002-initial-support-ugea.patch \
            file://0003-add-RS232-support-ttySTM1.patch \
            "

KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-06.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"
SRC_URI_class-devupstream += "file://${LINUX_VERSION}/fragment-06.config;subdir=fragments"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-arch-arm-boot-dts-st-stm32mp157a-ugea-microdev-mx-in.patch"

KERNEL_CONFIG_FRAGMENTS:append:stm32mp1common = " ${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"

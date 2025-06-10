FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-arch-arm-boot-dts-st-stm32mp157a-ugea-microdev-mx-in.patch \
            file://0002-arch-arm-boot-dts-st-stm32mp135d-ugea-microdev-port-.patch \
            file://0003-drivers-input-touchscreen-edt-ft5x26-add-support.patch \
            file://0004-arch-arm-boot-dts-st-stm32mp157a-ugea-microdev-mx-ad.patch \
            file://0005-arch-arm-boot-dts-st-stm32mp135d-ugea-microdev-mx-en.patch \
            "

KERNEL_CONFIG_FRAGMENTS:append:stm32mp1common = " ${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"

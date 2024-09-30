FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp2-Initial-EDIMM-dtb-commit-boot-and-porting-e.patch \
            file://0002-stm32mp2-enabled-usart1-usart6-and-m_can1.patch \
            file://0003-stm32mp2-Fixed-sdmmc1-node-pwr-supply.patch \
            file://0004-stm32mp2-Added-edt-ft5x26-ts-driver-and-setup-lvds-d.patch \
            file://0005-Fix-edt-ft5x26-ts-driver.patch \
            file://0006-stm32mp2-Added-support-for-wifi-and-bt-in-edimm2.patch \
            file://0007-stm32mp2-Added-device-tree-for-K.Touch10.patch \
            "

SRC_URI += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"

KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
KERNEL_CONFIG_FRAGMENTS:stm32mp25common += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"




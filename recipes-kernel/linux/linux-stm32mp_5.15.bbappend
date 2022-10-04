FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp135-gea-Basic-porting.patch \
            file://0002-stm32mp135-gea-Enabled-connectivity-peripherals.patch \
            file://0003-stm32mp135-gea-on-starterkit-Enabled-parallel-displa.patch \
            file://0004-stm32mp135-gea-on-starterkit-Ported-eMMC.patch \
            file://0005-Added-I2C-touchscreen-driver-EDT-FocalTech-FT5x26.patch \
	    file://0006-stm32mp135-ugea-porting-on-microdev2.0.patch \
            "

SRC_URI += "file://${LINUX_VERSION}/fragment-07-engicam.config;subdir=fragments"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-07-engicam.config"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-07-engicam.config;subdir=fragments"

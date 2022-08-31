FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp135-gea-Basic-porting.patch \
            file://0002-stm32mp135-gea-Enabled-connectivity-peripherals.patch \
            file://0003-stm32mp135-gea-on-starterkit-Enabled-parallel-displa.patch \
            file://0004-stm32mp135-gea-on-starterkit-Ported-eMMC.patch \
            "


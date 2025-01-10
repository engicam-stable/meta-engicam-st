FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp2-Initial-EDIMM-dtb-commit-boot-and-porting-e.patch \
            file://0002-stm32mp2-Fixed-sdmmc1-node-pwr-supply.patch \
            file://0003-stm32mp2-SmarCore-Porting-for-XTouch2.0-board.patch \
            file://0004-stm32mp2-iCore-enabled-lcd-in-u-boot-for-edimm2.patch \
            "


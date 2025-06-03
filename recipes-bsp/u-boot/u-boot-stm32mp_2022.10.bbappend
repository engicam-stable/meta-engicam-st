FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp2-Initial-EDIMM-dtb-commit-boot-and-porting-e.patch \
            file://0002-stm32mp2-Fixed-sdmmc1-node-pwr-supply.patch \
            file://0003-stm32mp2-SmarCore-Porting-for-XTouch2.0-board.patch \
            file://0004-stm32mp2-iCore-enabled-lcd-in-u-boot-for-edimm2.patch \
            file://0005-stm32mp2-SmarCore-changed-vmmc-supply-for-sdcard.patch \
            file://0006-stm32mp2-enabled-env-overwrite.patch \
            file://0007-stm32mp2-iCore-Added-device-tree-for-mask-D.patch \
            file://0008-stm32mp2-MicroGEA-Porting-for-EDIMM2.0-starterkit.patch \
            file://0009-stm32mp2-MicroGea-Config-default-device-tree.patch \
            file://0010-stm32mp2-SmarCore-porting-version-D-on-XTouch2.0-boa.patch \
            "

#DEVICE_TREE_FLAG = "DEVICE_TREE=${@d.getVar('UBOOT_DEVICETREE').split(',')[0]}"

#EXTRA_OEMAKE += "${DEVICE_TREE_FLAG}"
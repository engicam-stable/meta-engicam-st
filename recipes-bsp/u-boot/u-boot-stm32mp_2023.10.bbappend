FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initial-co.patch \
            file://0002-arch-arm-dts-stm32mp135d-ugea-microdev-port-stm32mp1.patch \
            file://0003-arch-arm-dts-stm32mp157a-ugea-microdev-mx-fix-ethern.patch \
            file://0004-arch-arm-dts-stm32mp157a-ugea-microdev-mx-add-displa.patch \
            file://0005-arch-arm-dts-stm32mp135d-ugea-microdev-mx-enable-dis.patch \
            file://0006-stm32mp25D-iCore-Initial-EDIMM-dtb-commit.patch \
            file://0007-stm32mp257f-iCore-porting-on-EDIMM2.patch \
            "


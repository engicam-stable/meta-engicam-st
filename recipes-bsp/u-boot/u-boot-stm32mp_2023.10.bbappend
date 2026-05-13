FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initial-co.patch \
            file://0002-arch-arm-dts-stm32mp135d-ugea-microdev-port-stm32mp1.patch \
            file://0003-arch-arm-dts-stm32mp157a-ugea-microdev-mx-fix-ethern.patch \
            file://0004-arch-arm-dts-stm32mp157a-ugea-microdev-mx-add-displa.patch \
            file://0005-arch-arm-dts-stm32mp135d-ugea-microdev-mx-enable-dis.patch \
            file://0006-stm32mp25D-iCore-Initial-EDIMM-dtb-commit.patch \
            file://0007-stm32mp257f-iCore-porting-on-EDIMM2.patch \
            file://0008-stm32mp257f-uGEA-initial-commit-for-micro5-proting.patch \
            file://0009-stm32mp235d-uGEA-porting-on-micro5.patch \
            file://0010-stm32mp257d-uGea-porting-on-micro5.patch \
            file://0005-stm32mp257d-uGea-fixed-RAM-size.patch \
            file://0006-stm32mp257d-ugea-on-micro5-fixed-ltdc-pins.patch \
            file://0007-stm32mp257D-Smarcore-XTouch2-Porting.patch \
            file://0011-arch-arm-dts-stm32mp157a-icore-starterkit2-mx-add-bo.patch \
            file://0012-stm32mp15-iCore-env-partition-in-config.patch \
            file://0013-stm32mp235d-iCore-Porting-on-edimm2.patch \
            file://0014-stm32mp257D-iCore-Added-support-for-CTouch-Ampire7.patch \
            "


FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-fdts-stm32mp157a-ugea-microdev-mx-initial-commit.patch \
            file://0002-fdts-stm32mp135d-ugea-microdev-mx-port-stm32mp135-mi.patch \
            file://0003-fdts-stm32mp157a-ugea-microdev-mx-switch-all-plls-to.patch \
            file://0004-stm32mp25D-Initial-EDIMM-dtb-commit.patch \
            file://0005-stm32mp257f-iCore-porting-on-EDIMM2.patch \
            file://0006-stm32mp257f-uGEA-initial-commit-for-micro5-proting.patch \
            file://0007-stm32mp235d-uGEA-porting-on-micro5.patch \
            file://0008-stm32mp235d-uGEA-changed-vdd2_ddr-power-and-DDR-freq.patch \
            file://0009-stm32mp257d-uGea-porting-on-micro5.patch \
            "


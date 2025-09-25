FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initi.patch \
            file://0002-core-arch-arm-stm32mp135d-ugea-microdev-add-stm32mp1.patch \
            file://0003-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-fix-c.patch \
            file://0004-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-switc.patch \
            file://0005-core-arch-arm-dts-stm32mp157a-ugea-microdev-enable-d.patch \
            file://0006-core-arch-arm-dts-stm32mp135d-ugea-microdev-mx-enabl.patch \
            file://0007-stm32mp25D-iCore-Initial-EDIMM-dtb-commit.patch \
            file://0008-stm32mp25d-iCore-fixed-firewall-config-for-pcie.patch \
            file://0009-stm32mp257f-iCore-porting-on-EDIMM2.patch \
            file://0010-stm32mp257f-uGEA-initial-commit-for-micro5-proting.patch \
            file://0011-stm32mp257f-uGEA-added-uart5-and-uart7.patch \
            file://0012-stm32mp257f-iCore-added-csi-and-dcmipp-support.patch \
            file://0013-stm32mp235d-uGEA-porting-on-micro5.patch \
            file://0014-stm32mp23-uGea-fixed-ddr-voltage-and-changed-DDR-fre.patch \
            file://0015-stm32mp257d-uGea-porting-on-micro5.patch \
            file://0009-stm32mp257d-uGea-fixed-RAM-size.patch \
            "

#ST_OPTEE_CORE_DEBUG:stm32mp13common = "y"
#ST_OPTEE_DEBUG_LOG_LEVEL = "4"

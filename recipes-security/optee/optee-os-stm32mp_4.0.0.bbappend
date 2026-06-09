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
            file://0010-stm32mp257F-uGea-firewall-settings-and-fixed-ram-pmi.patch \
            file://0011-stm32mp257d-uGea-Fixed-resmem-sizes.patch \
            file://0012-stm32mp257D-Smarcore-XTouch2-Porting.patch \
            file://0013-stm32mp257d-iCore-deprot-pins-for-iTouch-edimm-7.patch \
            file://0016-stm32mp257d-f-uGea-firewall-settings.patch \
            file://0017-core-arch-arm-dts-stm32mp157a-icore-starterkit2-mx-a.patch \
            file://0018-stm32mp1-iCore-enabled-dsi-pll.patch \
            file://0019-stm32mp1-iCore-set-sdmmc12-clock.patch \
            file://0020-stm32mp235d-iCore-Porting-on-edimm2.patch \
            file://0021-stm32mp23d-uGEA-enable-32kHz-clock-output-on-MCO1-po.patch \                
            file://0022-stm32mp2-iCore-Fixed-reserved-memory-filtering-for-M.patch \
            file://0023-stm32mp257D-iCore-Added-support-for-CTouch-Ampire7.patch \
            file://0024-Enabled-ETH-SWITCH-on-stm32mp257-i.core.patch \
            "

#ST_OPTEE_CORE_DEBUG:stm32mp13common = "y"
#ST_OPTEE_DEBUG_LOG_LEVEL = "4"

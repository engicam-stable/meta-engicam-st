FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp2-Initial-EDIMM-dtb-commit-boot-and-porting-e.patch \
            file://0002-stm32mp2-enabled-usart1-usart6-and-m_can1.patch \
            file://0003-stm32mp2-Removed-unsed-regulators.patch \
            file://0001-stm32mp2-Added-support-for-wifi-and-bt-in-edimm2.patch \
            file://0005-stm32mp2-desec-uart5-pins.patch \
            file://0006-stm32mp2-desec-sai-pins-and-enable-sai-clk.patch \
            file://0007-stm32mp2-Set-sai-MCLK-to-12MHz.patch \
            file://0008-stm32mp2-added-pmic-wake-up-pin-and-configure-PI7-fo.patch \
            file://0009-stm32mp2-SmarCore-Porting-for-XTouch2.0-board.patch \
            file://0010-stm32mp2-SmarCore-enabled-Ampire10-display-for-XTouc.patch \
            file://0011-stm32mp2-iCore-decprot-gpio-for-userspace-usage.patch \
            file://0012-stm32mp2-SmarCore-changed-OTP-124-for-1.8V-vddio.patch \
            file://0013-stm32mp2-iCore-Added-device-tree-for-mask-D.patch \
            file://0014-stm32mp2-MicroGEA-Porting-for-EDIMM2.0-starterkit.patch \
            file://0015-stm32mp2-MicroGEA-Set-SAI1-clock-Configured-protecti.patch \
            file://0016-stm32mp2-SmarCore-configured-firewall-for-CortexA-PC.patch \
            "

ST_OPTEE_DEBUG_LOG_LEVEL = "2"
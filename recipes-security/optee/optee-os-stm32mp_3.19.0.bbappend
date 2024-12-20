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
            "


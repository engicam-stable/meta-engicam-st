FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp2-Initial-EDIMM-dtb-commit-boot-and-porting-e.patch \
            file://0002-stm32mp2-enabled-usart1-usart6-and-m_can1.patch \
            file://0003-stm32mp2-Removed-unsed-regulators.patch \
            file://0001-stm32mp2-Added-support-for-wifi-and-bt-in-edimm2.patch \
            "


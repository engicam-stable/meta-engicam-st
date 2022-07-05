FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-initial-support-ugea.patch \
            file://0002-removed-default-pmic-support.patch \
            file://0003-add-nand-node.patch \
            file://0001-Deprotect-TIM4-and-fixed-uart-8-pinmux.patch \
            file://0001-Enabled-m_can-clock.patch \
            "


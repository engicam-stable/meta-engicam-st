FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Initial-commit-157-ugea.patch \
            file://0002-Initial-commit-157-icore.patch \
            file://0003-157-icore-Added-support-for-openframe-CTouch2.0.patch \
            file://0004-135-Gea-Added-support-for-EDIMM-1.0.patch \
            file://0005-135-Gea-Removed-135f-peripherals-from-device-tree.patch \
            file://0006-135-uGea-Added-support-for-microdev.patch \
            "

EXTRA_OEMAKE +=  "CFG_STM32_CRYP=n"
EXTRA_OEMAKE +=  "CFG_STM32_PKA=n"
EXTRA_OEMAKE +=  "CFG_STM32_SAES=n"

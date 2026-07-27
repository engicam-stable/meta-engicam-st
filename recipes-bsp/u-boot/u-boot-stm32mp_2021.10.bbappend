FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Initial-commit-157-ugea.patch \
            file://0002-Enabled-display-for-157-ugea.patch \
            file://0003-Added-nand-support-157-ugea.patch \
            file://0004-Initial-commit-157-icore.patch \
            file://0005-157-icore-Added-support-for-openframe-CTouch2.0.patch \
            file://0006-135-Gea-Added-support-for-EDIMM-1.0.patch \
            file://0007-135-uGea-Added-support-for-microdev.patch \
            file://0008-Updated-scmi_regu-node.patch \
            file://0009-135-uGea-Enabled-usb-otg-in-u-boot.patch \
            file://0010-135-ugea-Added-support-for-F-version.patch \
            file://0011-Set-internal-pull-up-on-uart4-RX.patch \
            file://0012-135-uGea-added-1GB-RAM-version.patch \
            file://0013-135-Gea-Added-support-for-F-version.patch \
            "


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-removed-default-pmic-support.patch \
            file://0001-initial-support-icore.patch \
            file://0002-Added-dsi-support-for-starterkit-lvds-display.patch \
            file://0003-Initial-support-for-icore-openframe.patch \
            "

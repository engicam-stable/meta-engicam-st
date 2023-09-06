SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

#FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI = " \
    file://fw_env.config \
"

DEPENDS += "u-boot-fw-utils"

do_install () {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/
    #install -m 0644 ${WORKDIR}/fw_env.config.* ${D}${sysconfdir}/
}

FILES_${PN} += "${sysconfdir}/"
RDEPENDS_${PN} += "u-boot-fw-utils"

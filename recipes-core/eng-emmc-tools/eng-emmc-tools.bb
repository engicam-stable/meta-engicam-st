SUMMARY = "Tools for emmc programmig"
DESCRIPTION = "This package provides tools for emmc programmig"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=ab04ac0f249af12befccb94447c08b77"

inherit allarch

SRC_URI = "file://emmc_tools.sh \
	   file://gpt-emmc \
	   file://LICENSE "

RDEPENDS:${PN} += "bash dosfstools e2fsprogs pv"

do_install () {
	install -d ${D}${bindir}
	install -d ${D}${datadir}
	install -d ${D}${datadir}/${PN}
	install -m 0755 ${WORKDIR}/emmc_tools.sh ${D}${bindir}/emmc_tools.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_tfa.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_tfa_metadata.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_fip.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_bootfs_fs.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_rootfs.sh
	ln -sf emmc_tools.sh ${D}${bindir}/emmc_full_image.sh
	install -m 0644 ${WORKDIR}/gpt-emmc ${D}${datadir}/${PN}/gpt-emmc
}

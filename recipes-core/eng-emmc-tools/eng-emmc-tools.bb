SUMMARY = "Tools for emmc programmig"
DESCRIPTION = "This package provides tools for emmc programmig"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=801f80980d171dd6425610833a22dbe6"

inherit allarch

SRC_URI = "file://emmc_tools.sh \
	   file://gpt-emmc \
   	   file://gpt-emmc-2G \
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
	install -m 0644 ${WORKDIR}/gpt-emmc ${D}${datadir}/${PN}/gpt-emmc-2G
}

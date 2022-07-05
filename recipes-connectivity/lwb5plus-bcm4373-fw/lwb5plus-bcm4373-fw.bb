
LICENSE = "CLOSED"

SRC_URI = "file://laird-lwb5plus-sdio-sa-firmware-10.4.0.10.tar.bz2"

do_install () {
	install -d ${D}/lib/
	cp -r ${WORKDIR}/lib/* ${D}/lib
}

FILES_${PN} = "/lib/*"

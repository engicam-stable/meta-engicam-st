FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# SRC_URI:remove = "file://ttt-ip-init-systemd.sh"
SRC_URI += " \
            file://mod-ttt-ip-init-tsn-no-networkd.sh \
            file://mod-ttt-ip-init-tsn-sysvinit.sh \
	"

# You would then have to OVERRIDE do_install to use the new filename
do_install:append() {
    # Manual logic to install your specifically named script
    install -m 0755 ${WORKDIR}/mod-ttt-ip-init-tsn-no-networkd.sh ${D}${sbindir}/ttt-ip-init-tsn-no-networkd.sh
    install -m 0755 ${WORKDIR}/mod-ttt-ip-init-tsn-sysvinit.sh ${D}${sbindir}/ttt-ip-init-tsn-sysvinit.sh
}

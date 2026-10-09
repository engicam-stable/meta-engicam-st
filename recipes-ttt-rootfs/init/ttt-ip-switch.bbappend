FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:remove = "file://72-switch-ep-static-ip.network"
SRC_URI += " \
	    file://mod-ttt-ip-common.sh \
	"

# You would then have to OVERRIDE do_install to use the new filename
do_install:append() {
    # Manual logic to install your specifically named script
    install -m 0755 ${WORKDIR}/mod-ttt-ip-common.sh ${D}${sbindir}/ttt-ip-common.sh
    install -m 0644 ${WORKDIR}/72-switch-ep-dhcp.network.sample ${D}${systemd_unitdir}/network/72-switch-ep-dhcp.network
}

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# SRC_URI:remove = "file://ttt-ip-init-systemd.sh"
SRC_URI += "file://mod-ttt-ip-init-systemd.sh"

# You would then have to OVERRIDE do_install to use the new filename
do_install:append() {
    # Manual logic to install your specifically named script
    install -m 0755 ${WORKDIR}/mod-ttt-ip-init-systemd.sh ${D}${sbindir}/ttt-ip-init-systemd.sh
}

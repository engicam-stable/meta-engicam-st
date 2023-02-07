#FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
    install -d ${D}${sysconfdir}/xdg/weston
    sed -i -e 's:xwayland=true:xwayland=false:g' ${D}${sysconfdir}/xdg/weston/weston.ini
    sed -i -e 's:transform=rotate-90:#transform=rotate-90:g' ${D}${sysconfdir}/xdg/weston/weston.ini
}

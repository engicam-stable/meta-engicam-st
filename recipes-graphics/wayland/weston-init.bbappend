#PR = "r3"

#DEPENDS += "xkeyboard-config"
#RDEPENDS_${PN} += "xkeyboard-config"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

#FILES_${PN} += "${libdir}/weston/* ${sysconfdir}/xdg"
#FILES_${PN}-dbg += "${libdir}/weston/.debug/*"

do_install_append() {
    install -d ${D}${sysconfdir}/xdg/weston
    sed -i -e 's:mode=preferred:mode=current:g' ${D}${sysconfdir}/xdg/weston/weston.ini
    sed -i -e 's:transform=270:transform=0:g' ${D}${sysconfdir}/xdg/weston/weston.ini
}

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://basic_engicam_splash_drm.c \
    "

do_compile:prepend () {
    cp basic_engicam_splash_drm.c basic_splash_drm.c
}

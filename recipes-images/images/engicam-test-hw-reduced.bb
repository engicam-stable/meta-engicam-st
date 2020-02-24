SUMMARY = "Engicam hardware test image"
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image distro_features_check

IMAGE_LINGUAS = "en-us"

IMAGE_FEATURES += "\
    splash \
    ssh-server-openssh \
    "

#
# Multimedia part addons
#
IMAGE_MM_PART = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'packagegroup-gstreamer1-0', '', d)} \
    tiff \
    libv4l \
    rc-keymaps \
    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'kmscube', '', d)} \
    "

#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-networkd-configuration', '', d)} \    
    \
    brcm-patchram-plus \
    \
    cantest \
    \
    devmem2 \
    \
    lwb-bcm4343w-fw \
    \
    mtd-utils \
    \
    obexftp \
    \
    packagegroup-framework-tools      \
    packagegroup-gstreamer1-0 \
    ppp \      
    \
    serialtools \
    \
    test-sound \
    "

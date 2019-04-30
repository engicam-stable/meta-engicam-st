SUMMARY = "Engicam hardware test image"
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image distro_features_check

IMAGE_LINGUAS = "en-us"

IMAGE_FEATURES += "\
    splash \
    ssh-server-dropbear \
    tools-profile \
    "
 
#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-networkd-configuration', '', d)} \
    \  
    mtd-utils \
    "

SUMMARY = "Engicam hardware test image"
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image distro_features_check

IMAGE_LINGUAS = "en-us"

IMAGE_FEATURES += "\
    splash \
    package-management \
    ssh-server-openssh \
    hwcodecs \
    tools-profile \
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
    mtd-utils \
    \
    obexftp \
    \
    packagegroup-framework-core-base    \
    packagegroup-framework-tools-base   \
    \
    packagegroup-framework-core         \
    packagegroup-framework-tools        \
    \
    packagegroup-framework-core-extra   \
    \
    ${@bb.utils.contains('COMBINED_FEATURES', 'optee', 'packagegroup-optee-core', '', d)} \
    ${@bb.utils.contains('COMBINED_FEATURES', 'optee', 'packagegroup-optee-test', '', d)} \
    \
    ${@bb.utils.contains('COMBINED_FEATURES', 'tpm2', 'packagegroup-security-tpm2', '', d)} \
    \
    packagegroup-st-demo \   
    packagegroup-gstreamer1-0 \
    ppp \      
    \
    serialtools \
    \
    test-sound \
    "

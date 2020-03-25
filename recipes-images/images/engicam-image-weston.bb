SUMMARY = "Engicam OpenSTLinux weston image with basic Wayland support (if enable in distro)."
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image distro_features_check

inherit populate_sdk_qt5

# let's make sure we have a good image...
REQUIRED_DISTRO_FEATURES = "wayland"

IMAGE_LINGUAS = "en-gb"

IMAGE_FEATURES += "\
    splash \
    package-management \
    hwcodecs \
    tools-profile \
    eclipse-debug \
    "

#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    \
    brcm-patchram-plus \
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
    \
    packagegroup-qt5-toolchain-target \
    "

# NOTE:
#   packagegroup-st-demo are installed on rootfs to populate the package
#   database.

CORE_IMAGE_EXTRA_INSTALL += " packagegroup-qt5-qtcreator-debug "

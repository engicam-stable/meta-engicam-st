SUMMARY = "Engicam weston image with basic Wayland support based on OpenSTLinux st-image-weston."

inherit populate_sdk_qt5

CORE_IMAGE_EXTRA_INSTALL += " \
    minicom \
    brcm-patchram-plus \
    libsocketcan  \
    can-utils \
    devmem2 \
    packagegroup-qt5-toolchain-target \
    "

#CORE_IMAGE_EXTRA_INSTALL +=  " packagegroup-qt5-qtcreator-debug "

RDEPENDS:${PN} = " \
    gdbserver \
    openssh-sftp-server \
    qtdeclarative \
"

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo "

CORE_IMAGE_EXTRA_INSTALL += " eng-emmc-tools "

#CORE_IMAGE_EXTRA_INSTALL += " \
#	packagegroup-framework-sample-qt            \
#	packagegroup-framework-sample-qt-examples   \
#    "
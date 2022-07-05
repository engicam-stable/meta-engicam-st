SUMMARY = "Engicam weston image with basic Wayland support based on OpenSTLinux st-image-weston."

inherit populate_sdk_qt5

CORE_IMAGE_EXTRA_INSTALL += " \
    packagegroup-qt5-toolchain-target \
    packagegroup-qt5-eng-qtcreator-debug \
    "

CORE_IMAGE_EXTRA_INSTALL_remove = " packagegroup-st-demo "

CORE_IMAGE_EXTRA_INSTALL += " \
  libsocketcan  \
  can-utils \
"

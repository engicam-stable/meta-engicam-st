FILESEXTRAPATHS_prepend := "${THISDIR}/:"
SRC_URI+=" \
          file://0001-start-ugea-stm32-support.patch \
          file://0002-add-ethernet-support.patch \
          file://0003-fix-usb-support.patch \
          file://0004-add-icorest-preliminary-support.patch \
        "

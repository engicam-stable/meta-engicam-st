FILESEXTRAPATHS_prepend := "${THISDIR}/:"
SRC_URI+=" \
          file://0001-start-ugea-stm32-support.patch \
          file://0002-add-ethernet-support.patch \
          file://0003-fix-usb-support.patch \
          file://0004-add-icorest-preliminary-support.patch \
          file://0005-fix-icore-defconfig.patch \
          file://0006-fix-eth-reset-bug.patch \
          file://0007-added-emmc-boot-on-icore-stm32mp1.patch \
          file://0008-fix-ram-values.patch \
          file://0011-Added-ugea-stm32-512MB-support.patch \      
        "

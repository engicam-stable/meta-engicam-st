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
          file://0012-change-eth-pll-ugea.patch \
          file://0012-change-eth-pll-ugea-512MB.patch \
          file://0013-fix-mmc1-pads-slew-rate.patch \
          file://0014-add-pullup-to-mmc1-data.patch \
          file://0015-added-new-memory-size-and-mpu-800.patch \
        "

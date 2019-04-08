FILESEXTRAPATHS_prepend := "${THISDIR}/:"
SRC_URI+=" \
            file://0001-first-ugea-commit.patch \
            file://0002-fix-opendrain-error-on-mmc1.patch \
            file://0003-eth0-is-working.patch \
            file://0004-Fix-bug-on-usb-phy-node-on-stm32mp157c.dtsi.patch \
            file://0005-usb-works.patch \
            file://0006-add-ugea-defconfig.patch \
            file://0007-add-microdev-ttySTM-serial-port.patch \
            file://0008-remove-useless-fmc_pins_mx-entry.patch \
            file://0009-revert-USB-patch-on-stm32mp157c.dtsi.patch \
            file://0010-add-sys-class-thermal-thermal_zone0-support.patch \
            file://0011-Add-edt-ft5x26-touch-driver.patch \
            file://0012-add-lcd-udev-7p.patch \
            file://0013-fix-gpu-section-on-ugea.patch \
        "

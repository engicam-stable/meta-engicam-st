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
            file://0014-added-support-RS485-for-ugeast.patch \
            file://0015-init-icorestm32-support.patch \
            file://0016-add-icorestm-defconfig.patch \
            file://0017-add-icorestm-makefile-dtb.patch \
            file://0018-added-support-ppp-and-set-host-usbotg-for-modem.patch \
            file://0019-fix-icore-defconfig-and-lcd-dtb.patch \
            file://0020-added-support-wifi-and-bluetooth-ugeast-on-microdev.patch \
      	    file://0021-fixed-dma-problem-for-SDIO-wifi.patch \
      	    file://0022-Fix-unnecessary-error-message-for-HCI-request-comple.patch \
            file://0023-sn65dsi83-running-on-7-inches-starterkit.patch \
            file://0024-linux-added-sgtl5000-support-for-i.core-stm32mp1.patch \
            file://0025-fix-sgtl5000-dts-entries.patch \
            file://0026-fix-touch-interrupt-line.patch \
            file://0027-fix-st1232-driver-for-weston.patch \
            file://0028-fix-dtb-mmc1-pin-redefinition.patch \
            file://0029-fixed-problem-drm-mode-lvds.patch \
            file://0030-fixed-lvds-icorestm32-starterkit-2.0.patch \
            file://0031-add-m4-dtb-example-on-ugeastm32mp1.patch \
            file://0032-add-lcd10-yes-support-on-microdev.patch \
            file://0033-Removed-memory-settings.patch \
            file://0034-change-eth-pll-ugea.patch \
            file://0035-fix-mmc1-boot-issue.patch \
            file://0036-add-usart1-on-icore-module.patch \
            file://0037-ported-capacitive-touch-ofcap2-10.patch \
            file://0038-added-quectel-EG95-support.patch \
            file://0039-fixed-ohci-controller-for-usb.patch \
            file://0040-removed-sdmmc2-from-starterkit-dtb-iCoreST.patch \
	    file://0041-added-fixed-sdmmc2-from-starterkit-dtb-iCoreST.patch \
        "

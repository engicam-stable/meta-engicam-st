FILESEXTRAPATHS_prepend := "${THISDIR}/:"
SRC_URI+=" \
            file://0001-tmp.patch \
            file://0002-uGea-start-from-sdcard.patch \
            file://0003-change-usb-clock-source.patch \
            file://0004-add-decproct-section.patch \
            file://0005-enable-ADC-clock.patch \
            file://0006-add-icorest-preliminary-support.patch \
            file://0007-unlock-sdmmc3-for-wifi-microdev.patch \
            file://0008-change-clock-from-internal-to-external.patch \
            file://0009-change-clock-from-internal-to-external-on-ugea.patch \
            file://0010-fix-clock-sdmmc3.patch \
            file://0011-Added-ugea-stm32-512MB-support.patch \
            file://0012-change-eth-pll-ugea.patch \
            file://0012-change-eth-pll-ugea-512MB.patch \
            file://0013-enable-uart1.patch \	 
            file://0014-added-new-memory-size-and-mpu-800.patch \
	    file://0015-ported-capacitive-touch-ofcap2-10.patch \
        "

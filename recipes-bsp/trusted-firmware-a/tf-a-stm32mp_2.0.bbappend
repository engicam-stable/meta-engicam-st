FILESEXTRAPATHS_prepend := "${THISDIR}/:"
SRC_URI+=" \
            file://0001-tmp.patch \
            file://0002-uGea-start-from-sdcard.patch \
            file://0003-change-usb-clock-source.patch \
            file://0004-add-decproct-section.patch \
            file://0005-enable-ADC-clock.patch \
            file://0006-add-icorest-preliminary-support.patch \
        "

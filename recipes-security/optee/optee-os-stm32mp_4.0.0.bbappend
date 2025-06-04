FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initi.patch \
            file://0002-core-arch-arm-stm32mp135d-ugea-microdev-add-stm32mp1.patch \
            file://0003-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-fix-c.patch \
            file://0004-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-switc.patch \
            file://0005-core-arch-arm-dts-stm32mp157a-ugea-microdev-enable-d.patch \
            "

#ST_OPTEE_CORE_DEBUG:stm32mp13common = "y"
#ST_OPTEE_DEBUG_LOG_LEVEL = "4"

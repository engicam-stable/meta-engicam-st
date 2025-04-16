FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initi.patch \
            file://0002-core-arch-arm-stm32mp135d-ugea-microdev-add-stm32mp1.patch \
            "

#ST_OPTEE_CORE_DEBUG:stm32mp13common = "y"
#ST_OPTEE_DEBUG_LOG_LEVEL = "4"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-core-arch-arm-dts-stm32mp157a-ugea-microdev-mx-initi.patch"

#ST_OPTEE_CORE_DEBUG:stm32mp15common = "y"
#ST_OPTEE_DEBUG_LOG_LEVEL = "3"

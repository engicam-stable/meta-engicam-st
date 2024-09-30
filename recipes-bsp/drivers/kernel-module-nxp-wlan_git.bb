SUMMARY = "NXP Wi-Fi driver for module 88w8801/8987/8997/9098 IW416/612"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://../../LICENSE;md5=ab04ac0f249af12befccb94447c08b77"

# For backwards compatibility
PROVIDES += "kernel-module-nxp89xx"
RREPLACES:${PN} = "kernel-module-nxp89xx"
RPROVIDES:${PN} = "kernel-module-nxp89xx"
RCONFLICTS:${PN} = "kernel-module-nxp89xx"

SRCBRANCH = "lf-6.1.55_2.2.0"
MRVL_SRC ?= "git://github.com/nxp-imx/mwifiex.git;protocol=https"
SRC_URI = "${MRVL_SRC};branch=${SRCBRANCH}"
SRCREV = "952d10f3349426f917636a4560974117eb6eef5b"


S = "${WORKDIR}/git/mxm_wifiex/wlan_src"

inherit module

EXTRA_OEMAKE = "KERNELDIR=${STAGING_KERNEL_BUILDDIR} -C ${STAGING_KERNEL_BUILDDIR} M=${S}"

COMPATIBLE_MACHINE = "(stm32mp2common)"

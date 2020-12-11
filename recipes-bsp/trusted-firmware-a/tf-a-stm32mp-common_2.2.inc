FILESEXTRAPATHS_prepend_stm32mpcommon := "${THISDIR}/tf-a-stm32mp:"

SECTION = "bootloaders"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"

SRC_URI = "git://github.com/engicam-stable/tfa-stm32mp.git;protocol=git;branch=dunfell"
SRCREV_default = "${AUTOREV}"

TF_VERSION = "2.2"
PV = "${TF_VERSION}.r1"

S = "${WORKDIR}/git"

# ---------------------------------
# Configure devupstream class usage
# ---------------------------------
BBCLASSEXTEND = "devupstream:target"

#SRC_URI_class-devupstream ?= "git://github.com/STMicroelectronics/arm-trusted-firmware.git;protocol=https;name=tfa;branch=v${TF_VERSION}-stm32mp"
#SRCREV_class-devupstream ?= "e587179e7b0823b5c6e38e029e417d10f088db51"
#SRCREV_FORMAT_class-devupstream = "tfa"
#PV_class-devupstream = "${TF_VERSION}+github+${SRCPV}"

# ---------------------------------
# Configure default preference to manage dynamic selection between tarball and github
# ---------------------------------
STM32MP_SOURCE_SELECTION ?= "tarball"

DEFAULT_PREFERENCE = "${@bb.utils.contains('STM32MP_SOURCE_SELECTION', 'github', '-1', '1', d)}"

# Adaptation from u-boot-common_${PV}.inc
require u-boot-stm32mp.inc

DESCRIPTION = "STM32MP U-Boot suppporting Engicam boards."
SECTION = "bootloaders"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"

DEPENDS += "dtc-native bc-native"
DEPENDS += "flex-native bison-native"

COMPATIBLE_MACHINE = "(stm32mpcommon)"

SRC_URI = "git://github.com/engicam-stable/uboot-stm32mp.git;protocol=git;branch=thud"
#SRCREV = "a23cb26c8a4b6e0c4ff6d4727b19b597d96e9561"
SRCREV_default = "${AUTOREV}"

U_BOOT_VERSION = "2018.11"
PV = "${U_BOOT_VERSION}"

S = "${WORKDIR}/git"

# ---------------------------------
# Configure devupstream class usage
# ---------------------------------
BBCLASSEXTEND = "devupstream:target"

# ---------------------------------
# Configure default preference to manage dynamic selection between tarball and github
# ---------------------------------
STM32MP_SOURCE_SELECTION ?= "tarball"

DEFAULT_PREFERENCE = "${@bb.utils.contains('STM32MP_SOURCE_SELECTION', 'github', '-1', '1', d)}"
include ${@oe.utils.ifelse(d.getVar('ST_ARCHIVER_ENABLE') == '1', 'u-boot-stm32mp-archiver.inc','')}

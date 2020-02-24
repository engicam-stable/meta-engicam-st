SUMMARY = "Trusted Firmware-A for STM32MP1 (Engicam Board)"
SECTION = "bootloaders"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"

SRC_URI = "git://github.com/engicam-stable/tfa-stm32mp.git;protocol=git;branch=thud"
SRCREV = "0ca47eb37a8b1d963f1c6b16532d9fe5d40672e4"

TF_VERSION = "2.0"
PV = "${TF_VERSION}"

S = "${WORKDIR}/git"

require tf-a-stm32mp-common.inc

# ---------------------------------
# Configure archiver use
# ---------------------------------
include ${@oe.utils.ifelse(d.getVar('ST_ARCHIVER_ENABLE') == '1', 'tf-a-stm32mp-archiver.inc','')}

# ---------------------------------
# Configure devupstream class usage
# ---------------------------------
BBCLASSEXTEND = "devupstream:target"

# ---------------------------------
# Configure default preference to manage dynamic selection between tarball and github
# ---------------------------------
STM32MP_SOURCE_SELECTION ?= "tarball"

DEFAULT_PREFERENCE = "${@bb.utils.contains('STM32MP_SOURCE_SELECTION', 'github', '-1', '1', d)}"

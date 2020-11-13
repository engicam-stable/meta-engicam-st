SUMMARY = "Linux Kernel provided and supported by Engicam"
DESCRIPTION = "Linux Kernel provided and supported by Engicam with"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"

include linux-stm32mp.inc

# Put a local version until we have a true SRCREV to point to
LOCALVERSION ?= ""
SCMVERSION ?= "y"
SRCBRANCH ?= ""

DEPENDS += "lzop-native bc-native"

DEFAULT_PREFERENCE = "1"

SRC_URI = "git://github.com/engicam-stable/linux-stm32mp.git;protocol=git;branch=dunfell"
SRCREV = "c851d51a318f42ade817e0d5aba12bf1db646ece"

S = "${WORKDIR}/git"

addtask copy_defconfig after do_unpack before do_preconfigure
do_copy_defconfig () {
        install -d ${B}
        mkdir -p ${B}
        cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/.config
        cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
}

COMPATIBLE_MACHINE = "(ugea)"

# ---------------------------------
# Configure archiver use
# ---------------------------------
include ${@oe.utils.ifelse(d.getVar('ST_ARCHIVER_ENABLE') == '1', 'linux-stm32mp-archiver.inc','')}

KERNEL_EXTRA_ARGS += "LOADADDR=${ST_KERNEL_LOADADDR}"

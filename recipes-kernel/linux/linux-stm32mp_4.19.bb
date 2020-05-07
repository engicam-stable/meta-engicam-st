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

SRC_URI = "git://github.com/engicam-stable/linux-stm32mp.git;protocol=git;branch=thud"
SRCREV = "442d284353df249cc76d0574238a1acbdb557275"


S = "${WORKDIR}/git"

addtask copy_defconfig after do_unpack before do_preconfigure
do_copy_defconfig () {
        install -d ${B}
        mkdir -p ${B}
        cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/.config
        cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
}

COMPATIBLE_MACHINE = "(ugea|icore)"

# -------------------------------------------------------------
# Kernel Args
#
KERNEL_EXTRA_ARGS += "LOADADDR=${ST_KERNEL_LOADADDR}"


#inherit kernel fsl-kernel-localversion fsl-vivante-kernel-driver-handler

# Put a local version until we have a true SRCREV to point to
#LOCALVERSION ?= ""
#SCMVERSION ?= "y"
#SRCBRANCH ?= ""

#DEPENDS += "lzop-native bc-native"

#DEFAULT_PREFERENCE = "1"

#SRC_URI = "git://github.com/engicam-stable/linux-engicam_4.14.98.git;protocol=git;branch=linux-engicam_4.14.98"
#SRCREV = "ffb034d225d45150539d15c9786faed21dbc492c"

#SRC_URI_append_mx8mm += "file://0001-fix-reboot.patch"
#SRC_URI_append_mx8mm += "file://0002-fix-sdhc1-pads.patch"

#S = "${WORKDIR}/git"

#addtask copy_defconfig after do_unpack before do_preconfigure
#do_copy_defconfig () {
#      install -d ${B}
#       mkdir -p ${B}
#     cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/.config
#    cp  ${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
#}

#COMPATIBLE_MACHINE = "(mx8|mx6)"

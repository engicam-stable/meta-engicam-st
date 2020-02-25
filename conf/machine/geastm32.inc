#@TYPE: Machine
#@NAME: stm32mp1-ugea
#@DESCRIPTION: Configuration for ugeastm32mp1 board (Trusted boot and SDcard only)
#@NEEDED_BSPLAYERS:

include conf/machine/include/engicam-machine-common-stm32.inc

# Define specific common machine name
MACHINEOVERRIDES .= ":stm32mp1-eval"
MACHINEOVERRIDES .= ":ugea"

# =========================================================================
# Chip architecture
# =========================================================================
DEFAULTTUNE = "cortexa7thf-neon-vfpv4"
include conf/machine/include/tune-cortexa7.inc

# =========================================================================
# boot scheme
# =========================================================================
#BOOTSCHEME_LABELS += "basic"
BOOTSCHEME_LABELS += "trusted"
#BOOTSCHEME_LABELS += "optee"

# =========================================================================
# boot device
# =========================================================================
# Define the boot device supported
#BOOTDEVICE_LABELS += "emmc"
#BOOTDEVICE_LABELS += "nand-4-256"
#BOOTDEVICE_LABELS += "nor-emmc"
#BOOTDEVICE_LABELS += "nor-nand-4-256"
#BOOTDEVICE_LABELS += "nor-sdcard"
BOOTDEVICE_LABELS += "sdcard"

# =========================================================================
# Machine settings
# =========================================================================
# Define list of devicetree per board
#STM32MP_DT_FILES_DK += "stm32mp157a-dk1"
#STM32MP_DT_FILES_DK += "stm32mp1-ugea"
#STM32MP_DT_FILES_ED += "stm32mp157c-ed1"
#STM32MP_DT_FILES_EV += "stm32mp157c-ev1"

# =========================================================================
# Machine features
# =========================================================================
MACHINE_FEATURES += "bluetooth"
MACHINE_FEATURES += "wifi"
MACHINE_FEATURES += "gpu"
# Splashscreen enabled
MACHINE_FEATURES += "splashscreen"

# =========================================================================
# Image
# =========================================================================
# Add ubi FSTYPES to default ones for nand volumes
#IMAGE_FSTYPES += "stmultiubi"

# =========================================================================
# Kernel
# =========================================================================
# For eval board: auto-load goodix module (touchscreen module)
#KERNEL_MODULE_AUTOLOAD = "goodix"

# Define the devicetree for Linux A7 examples
LINUX_A7_EXAMPLES_DT += "stm32mp157c-dk2-a7-examples"
#LINUX_A7_EXAMPLES_DT += "stm32mp157c-ev1-a7-examples"

# =========================================================================
# M4 copro
# =========================================================================
# Define the devicetree for M4 example
CUBE_M4_EXAMPLES_DT += "stm32mp157c-dk2-m4-examples"
#CUBE_M4_EXAMPLES_DT += "stm32mp157c-ev1-m4-examples"

# Define specific board reference to use
M4_BOARDS = "STM32MP157C-DK2"

# =========================================================================
# extlinux configuration
# =========================================================================
# As example, modify the default boot config for each target to M4 config
#UBOOT_EXTLINUX_DEFAULT_LABEL_mp157c-dk2_sdcard       = "stm32mp157c-dk2-m4-examples-sdcard"
#UBOOT_EXTLINUX_DEFAULT_LABEL_mp157c-dk2_sdcard-optee = "stm32mp157c-dk2-m4-examples-sdcard-optee"

# =========================================================================
# WIC for sdcard raw image
# =========================================================================
WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"
WKS_FILE_DEPENDS ?= " \
    u-boot-stm32mp \
    tf-a-stm32mp \
    ${@bb.utils.contains('BOOTSCHEME_LABELS', 'optee', 'optee-os-stm32mp', '', d)} \
    st-image-bootfs \
    st-image-vendorfs \
    st-image-userfs \
"
# for generated a WIC file, please uncomment the 2 following lines
#IMAGE_FSTYPES += "wic"
#WKS_FILE += "${@bb.utils.contains('BOOTSCHEME_LABELS', 'optee', 'sdcard-stm32mp157c-dk2-optee-1GB.wks', 'sdcard-stm32mp157c-dk2-trusted-1GB.wks', d)}"

EXTLINUX_ROOT_EMMC         = "root=/dev/mmcblk1p4"
EXTLINUX_ROOT_EMMC_OPTEE   = "root=/dev/mmcblk1p7"
EXTLINUX_ROOT_NAND         = "ubi.mtd=UBI rootfstype=ubifs root=ubi0:rootfs"
EXTLINUX_ROOT_NOREMMC      = "root=/dev/mmcblk1p3"
EXTLINUX_ROOT_NORSDCARD    = "root=/dev/mmcblk0p3"
EXTLINUX_ROOT_SDCARD       = "root=/dev/mmcblk0p6"
EXTLINUX_ROOT_SDCARD_OPTEE = "root=/dev/mmcblk0p9"

KERNEL_DEFCONFIG        = "stm32mp1ugea_defconfig"

STM32MP_DT_FILES_EV += "stm32mp157a-ugeast-mx"

KERNEL_DEVICETREE = "stm32mp157a-ugeast-mx.dtb \
                     stm32mp157a-ugeast-mx-lcd7.dtb \
                     stm32mp157a-ugeast-mx-lcd10.dtb \
                     stm32mp157a-ugeast-mx-m4.dtb"

# -----------------------------------------------------------------------------
# uGea configuration
# -----------------------------------------------------------------------------
# Define available targets to use

UBOOT_EXTLINUX_TARGETS= "mp157a-ugeast-mx-lcd7 mp157a-ugeast-mx-lcd10 mp157a-ugeast-mx mp157a-ugeast-mx-m4"
UBOOT_EXTLINUX_LABELS = "mp157a-ugeast-mx-lcd7 mp157a-ugeast-mx-lcd10 mp157a-ugeast-mx mp157a-ugeast-mx-m4"

UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx        = "/stm32mp157a-ugeast-mx.dtb"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx-lcd7   = "/stm32mp157a-ugeast-mx-lcd7.dtb"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx-lcd10  = "/stm32mp157a-ugeast-mx-lcd10.dtb"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx-m4     = "/stm32mp157a-ugeast-mx-m4.dtb"


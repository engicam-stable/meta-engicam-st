#@TYPE: Machine
#@NAME: icore-stm32mp
#@DESCRIPTION: Configuration for icorestm32mp1 board (Trusted boot and SDcard only)
#@NEEDED_BSPLAYERS:

include conf/machine/include/engicam-machine-common-stm32.inc

# Define specific common machine name
MACHINEOVERRIDES .= ":stm32mp1-eval"
MACHINEOVERRIDES .= ":icore"

# =========================================================================
# Chip architecture
# =========================================================================
DEFAULTTUNE = "cortexa7thf-neon-vfpv4"
include conf/machine/include/tune-cortexa7.inc

# =========================================================================
# boot scheme
# =========================================================================
BOOTSCHEME_LABELS += "trusted"

# =========================================================================
# Machine features
# =========================================================================
#MACHINE_FEATURES += "bluetooth"
#MACHINE_FEATURES += "wifi"
MACHINE_FEATURES += "gpu"
# Splashscreen enabled
MACHINE_FEATURES += "splashscreen"

# =========================================================================
# Image
# =========================================================================
# Add ubi FSTYPES to default ones for nand volumes
IMAGE_FSTYPES += "stmultiubi"

# =========================================================================
# Kernel
# =========================================================================
# Kernel config
# Set this address to 0xC2000040, which is 0xC2000000 + 0x40.
# 0xC2000000 is the memory address where U-Boot will copy from flash the file uImage and 0x40 is uImage header size (64Bytes).
# With this value, U-Boot will be able to execute in place the zImage contained in uImage.
ST_KERNEL_LOADADDR   = "0xC2000040"


# =========================================================================
# flashlayout
# =========================================================================
# Define the config labels to use to generate flashlayout file
#FLASHLAYOUT_CONFIG_LABELS += "emmc"
#FLASHLAYOUT_CONFIG_LABELS += "nand-4-256"
#FLASHLAYOUT_CONFIG_LABELS += "nor-sdcard"
#FLASHLAYOUT_CONFIG_LABELS += "nor-emmc"
#FLASHLAYOUT_CONFIG_LABELS += "nor-nand-4-256"
FLASHLAYOUT_CONFIG_LABELS += "sdcard"

# =========================================================================
# M4 copro
# =========================================================================
# Define the devicetree for M4 example
M4_DEVICETREE += "stm32mp157c-ev1-m4-examples"

# Define specific board reference to use
M4_BOARDS = "STM32MP157C-EV1"

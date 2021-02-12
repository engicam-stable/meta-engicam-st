#@TYPE: Machine
#@NAME: stm32mp1-ugea
#@DESCRIPTION: Configuration for ugea board with 256MB RAM
#@NEEDED_BSPLAYERS: meta-engicam-st

include conf/machine/include/st-machine-common-stm32mp.inc
include conf/machine/include/st-machine-providers-stm32mp.inc

# Define specific familly common machine name
MACHINEOVERRIDES .= ":stm32mp1common:ugea"

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
# Define u-boot defconfig and binary to use for each UBOOT_CONFIG
UBOOT_CONFIG[trusted] = "stm32mp15_ugeast_trusted_defconfig,,u-boot.stm32"
KERNEL_DEFCONFIG=" stm32mp1ugea_defconfig"

# =========================================================================

# =========================================================================
# boot device
# =========================================================================
# Define the boot device supported
#BOOTDEVICE_LABELS += "emmc"
#BOOTDEVICE_LABELS += "nand-4-256"
BOOTDEVICE_LABELS += "sdcard"

# =========================================================================
# Machine settings
# =========================================================================
#STM32MP_DT_FILES_EV += " stm32mp157a-ugeast-mx "
STM32MP_DT_FILES_ED += " stm32mp157a-ugeast-mx "

# =========================================================================
# Machine features
# =========================================================================
MACHINE_FEATURES += "splashscreen"
MACHINE_FEATURES += "watchdog"
MACHINE_FEATURES += "bluetooth"
MACHINE_FEATURES += "wifi"
MACHINE_FEATURES += "${@'gpu' if d.getVar('ACCEPT_EULA_'+d.getVar('MACHINE')) == '1' else ''}"
MACHINE_FEATURES += "m4copro"

# Bluetooth
BLUETOOTH_LIST += "linux-firmware-bluetooth-bcm4343"
# Wifi
WIFI_LIST += "linux-firmware-bcm43430"

EXTLINUX_ROOT_EMMC         = "root=/dev/mmcblk1p4"
EXTLINUX_ROOT_EMMC_OPTEE   = "root=/dev/mmcblk1p7"
EXTLINUX_ROOT_NAND         = "ubi.mtd=UBI rootfstype=ubifs root=ubi0:rootfs"
EXTLINUX_ROOT_NOREMMC      = "root=/dev/mmcblk1p3"
EXTLINUX_ROOT_NORSDCARD    = "root=/dev/mmcblk0p3"
EXTLINUX_ROOT_SDCARD       = "root=/dev/mmcblk0p6"
EXTLINUX_ROOT_SDCARD_OPTEE = "root=/dev/mmcblk0p9"

KERNEL_DEVICETREE = "\
			stm32mp157a-ugeast-mx.dtb \
			stm32mp157a-ugeast-mx-lcd7.dtb \
			stm32mp157a-ugeast-mx-m4.dtb \
"

UBOOT_EXTLINUX_TARGETS = "mp157a-ugeast-mx-lcd7 mp157a-ugeast-mx mp157a-ugeast-mx-m4"
UBOOT_EXTLINUX_LABELS = "mp157a-ugeast-mx-lcd7 mp157a-ugeast-mx mp157a-ugeast-mx-m4"

UBOOT_EXTLINUX_DEFAULT_LABEL = "stm32mp157a-ugeast-mx-lcd7"

UBOOT_EXTLINUX_MENU_DESCRIPTION_mp157a-ugeast-mx-lcd7 = "stm32mp157a-ugeast-mx-lcd7"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx-lcd7 = "/stm32mp157a-ugeast-mx-lcd7.dtb"
UBOOT_EXTLINUX_MENU_DESCRIPTION_mp157a-ugeast-mx = "stm32mp157a-ugeast-mx"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx = "/stm32mp157a-ugeast-mx.dtb"
UBOOT_EXTLINUX_MENU_DESCRIPTION_mp157a-ugeast-mx-m4 = "stm32mp157a-ugeast-mx-m4"
UBOOT_EXTLINUX_FDT_mp157a-ugeast-mx-m4 = "/stm32mp157a-ugeast-mx-m4.dtb"

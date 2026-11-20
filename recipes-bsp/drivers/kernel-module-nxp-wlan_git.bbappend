FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Fixed-casting-char-for-moal-module-compilation.patch;patchdir=../.."


# STM32MP1 kernels have no PCI support: build only the SDIO variants
EXTRA_OEMAKE:append:stm32mp1common = " CONFIG_PCIE8997=n CONFIG_PCIE9098=n"

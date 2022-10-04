FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-stm32mp135-gea-Basic-porting.patch \
            file://0002-stm32mp135-gea-Enabled-connectivity-peripherals.patch \
            file://0003-stm32mp135-gea-on-starterkit-Enabled-parallel-displa.patch \
            file://0004-Configured-i2c5-pull-up-resistance.patch \
            file://0005-stm32mp135-ugea-porting-on-microdev2.0.patch \
            "
CFG_TEE_CORE_DEBUG="y"
CFG_TEE_CORE_LOG_LEVEL="4"

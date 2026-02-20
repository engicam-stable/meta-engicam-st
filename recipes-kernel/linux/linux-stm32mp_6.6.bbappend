FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-arch-arm-boot-dts-st-stm32mp157a-ugea-microdev-mx-in.patch \
            file://0002-arch-arm-boot-dts-st-stm32mp135d-ugea-microdev-port-.patch \
            file://0003-drivers-input-touchscreen-edt-ft5x26-add-support.patch \
            file://0004-arch-arm-boot-dts-st-stm32mp157a-ugea-microdev-mx-ad.patch \
            file://0005-arch-arm-boot-dts-st-stm32mp135d-ugea-microdev-mx-en.patch \
            file://0006-stm32mp25D-iCore-Initial-EDIMM-dtb-commit.patch \
            file://0007-Changing-sai-master-clock-tolerance.patch \
            file://0008-stm32mp25d-iCore-ported-pcf-and-pcie-for-edimm2.patch \
            file://0009-stm32mp257f-iCore-porting-on-EDIMM2.patch \
            file://0010-stm32mp257f-uGEA-initial-commit-for-micro5-proting.patch \
            file://0011-stm32mp257f-uGEA-added-uart5-and-uart7-fix-touchscre.patch \
            file://0012-stm32mp257f-iCore-porting-csi-camera-ov5640.patch \
            file://0013-stm32mp235d-uGEA-porting-on-micro5.patch \
            file://0014-stm32mp2xx-uGea-Fixed-pixel-clock-panel-on-micro5.patch \
            file://0015-stm32mp257d-uGea-porting-on-micro5.patch \
            file://0009-stm32mp257d-uGea-fixed-RAM-size.patch \
            file://0016-Added-mxl-86110-driver.patch \
            file://0017-stm32mp257d-uGea-porting-on-EDIMM-2.0.patch \
            file://0018-stm32mp257D-Smarcore-XTouch2-Porting.patch \
            file://0019-MP257D-iCore-Porting-CTouch2-with-Ampire-10.patch \
            file://0020-stm32mp257d-iCore-porting-i.Touch-edimm-7inch.patch \
            file://0021-stm32mp257d-uGea-micro-5-fixed-reset-lcd.patch \
            file://0022-arch-arm-dts-boot-st-stm32mp157a-icore-starterkit2-m.patch \
            file://0023-stm32mp1-iCore-fixed-lvds.patch \
            "

KERNEL_CONFIG_FRAGMENTS:append:stm32mp1common = " ${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
KERNEL_CONFIG_FRAGMENTS:append:stm32mp2common = " ${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-engicam.config"
SRC_URI += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-05-engicam.config;subdir=fragments"

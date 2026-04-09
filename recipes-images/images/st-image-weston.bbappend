CORE_IMAGE_EXTRA_INSTALL += " \
    brcm-patchram-plus \
    can-utils \
    devmem2 \
    eng-emmc-tools \
    iperf3 \
    libsocketcan  \
    minicom \
    mmc-utils \
    mtd-utils-ubifs \
    u-boot-stm32mp-splash \
    u-boot-fw-utils \
    u-boot-fw-config-stm32mp \
    "

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo "


# IMAGE_INSTALL:append:stm32mp25f-ugea = " \
#     kernel-module-ti-backports \
#     ti351-firmware \
# "

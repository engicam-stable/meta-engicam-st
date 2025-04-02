CORE_IMAGE_EXTRA_INSTALL += " \
    minicom \
    mtd-utils-ubifs \
    libsocketcan  \
    can-utils \
    iperf3 \
    devmem2 \
    eng-emmc-tools \
    brcm-patchram-plus \    
    u-boot-stm32mp-splash \
    "

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo "



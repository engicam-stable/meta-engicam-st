CORE_IMAGE_EXTRA_INSTALL += " \
    minicom \
    libsocketcan  \
    can-utils \
    devmem2 \
    eng-emmc-tools \
    brcm-patchram-plus \    
    "

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo "



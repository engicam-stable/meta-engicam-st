SUMMARY = "Engicam image with basic Wayland support."
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc
inherit core-image features_check

# let's make sure we have a good image...
REQUIRED_DISTRO_FEATURES = "wayland"

IMAGE_LINGUAS = "en-gb"

IMAGE_FEATURES += "\
	splash \
"

CORE_IMAGE_EXTRA_INSTALL += " \
	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-networkd-configuration', '', d)} \
	\
	packagegroup-framework-core-base \
	packagegroup-framework-tools-base \
	packagegroup-framework-tools \
	packagegroup-core-ssh-openssh \
	devmem2 \
	weston \
	weston-init \
	weston-examples \
	libdrm \
	rsync \
	fontconfig \
	mtd-utils-ubifs \
	eng-emmc-tools \
	brcm-patchram-plus \
	libsocketcan  \
    can-utils \
	minicom \
"

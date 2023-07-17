SUMMARY = "Reduced Engicam OpenSTLinux weston image with basic Wayland support (if enable in distro)."
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image features_check

# let's make sure we have a good image...
REQUIRED_DISTRO_FEATURES = "wayland"

IMAGE_LINGUAS = "en-gb"

#
# Multimedia part addons
#
IMAGE_MM_PART = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'packagegroup-gstreamer1-0', '', d)} \
    tiff \
    libv4l \
    rc-keymaps \
    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'kmscube', '', d)} \
    "

#
# Display part addons
#
IMAGE_DISPLAY_PART = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston weston-init weston-examples', '', d)} \
    fb-test         \
    libdrm          \
    libdrm-tests    \
    "

#
# Display part addons: X11 via Xwayland
#
IMAGE_X11_XWAYLAND_DISPLAY_PART = " \
    weston-xwayland \
    xserver-xorg-xwayland \
    xkbcomp \
    libxcb \
    libxcursor \
    xf86-input-evdev \
    xf86-input-mouse \
    xf86-input-keyboard \
    xterm \
    xinput \
    xeyes \
    xclock \
    xorg-minimal-fonts \
    libx11 libx11-locale \
    qtwayland \
    qtserialport \
    qtserialbus \
    packagegroup-core-ssh-openssh \
    nfs-utils \
    qtquickcontrols \
    qtquickcontrols2 \
    sqlite \
    brcm-patchram-plus \
"

PACKAGECONFIG:remove:qtwayland = " xcomposite-glx "


IMAGE_X11_DISPLAY_PART = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', '${IMAGE_X11_XWAYLAND_DISPLAY_PART}', '', d)} \
    "

#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-networkd-configuration', '', d)} \
    \
    packagegroup-framework-core-base    \
    packagegroup-framework-tools-base   \
    \
    ${IMAGE_DISPLAY_PART}                       \
    ${IMAGE_MM_PART}                            \
    \
    ${IMAGE_X11_DISPLAY_PART}                   \
    "


CORE_IMAGE_EXTRA_INSTALL += " packagegroup-qt5-qtcreator-debug "

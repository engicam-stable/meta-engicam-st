DESCRIPTION = "engicam image for iot application based on python"

LICENSE = "MIT"

inherit core-image

EXTRA_IMAGE_FEATURES = " debug-tweaks ssh-server-openssh tools-debug "


IMAGE_INSTALL_append = " \
	packagegroup-framework-tools-core-base      \
	packagegroup-framework-tools-network-base   \
	binutils \
	iproute2 \
	mtd-utils \
	mtd-utils-ubifs \
	devmem2 \
	i2c-tools \
	fbset \
	ethtool \
	dosfstools \
	e2fsprogs \
	usbutils \
	cpufrequtils \
	wpa-supplicant \
	brcm-patchram-plus \
	lwb-bcm4343w-fw \
	obexftp \
	ppp-dialin \
	ppp \
	hostapd \
	iptables \
	python-paho-mqtt \
	python-pyserial \
	python-pip \
	python-psutil \
	python-lxml \
	python-pysnmp \
	python-pysqlite \
	mysql-python \
	nfs-utils \
"

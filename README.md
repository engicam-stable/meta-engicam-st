meta-engicam-st
================

Based on STM32MPU Distribution Package 

	openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05

Retrieve the sources
--------------------

```
mkdir openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
cd openstlinux-6.6-yocto-scarthagap-mpu-v24.12.05
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
repo sync
```

BSP meta-layers repositories:

**meta-openembedded**
remote="http://git.openembedded.org/meta-openembedded"
path="layers/meta-openembedded"
revision="1235dd4ed4a57e67683c045ad76b6a0f9e896b45"

**bitbake**
remote="http://git.openembedded.org/bitbake"
path="layers/openembedded-core/bitbake"
revision="11d83170922a2c6b9db1f6e8c23e533526984b2c"

**openembedded-core**
name="http://git.openembedded.org/openembedded-core"
path="layers/openembedded-core"
revision="236ac1b43308df722a78d3aa20aef065dfae5b2b"

**meta-st-openstlinux**
remote="https://github.com/STMicroelectronics/meta-st-openstlinux"
path="layers/meta-st/meta-st-openstlinux"
revision="a25d4806880cdc73471e3c1824a87901b5a4e44f"

**meta-st-stm32mp**
remote="https://github.com/STMicroelectronics/meta-st-stm32mp"
path="layers/meta-st/meta-st-stm32mp"
revision="69a81db920e98ff3e3922f59eecbc50d91c31299"

**meta-st-stm32mp-addons**
remote="https://github.com/STMicroelectronics/meta-st-stm32mp-addons"
path="layers/meta-st/meta-st-stm32mp-addons"
revision="97617f888513d89c4070f59bfdfa2a91e8175d5c"

**meta-st-scripts**
remote="https://github.com/STMicroelectronics/meta-st-scripts"
path="layers/meta-st/scripts"
revision="27b8b0df3b2f3515d5e51de65f54eff00ddacb82"

Ex. First build
-----------

```
cd layers
git clone https://github.com/engicam-stable/meta-engicam-st.git -b scarthgap-6.6_v24.12
cd ..

DISTRO=openstlinux-weston MACHINE=stm32mp15-eval source layers/meta-st/scripts/envsetup.sh build
sed -i 's/^MACHINE = "stm32mp15-eval"/MACHINE = "stm32mp15-ugea"/' conf/local.conf

bitbake-layers add-layer ../layers/meta-engicam-st
bitbake st-image-core
```

```
Build Configuration:
BB_VERSION           = "2.8.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-22.04"
TARGET_SYS           = "arm-ostl-linux-gnueabi"
MACHINE              = "stm32mp15-ugea"
DISTRO               = "openstlinux-weston"
DISTRO_VERSION       = "5.0.3-snapshot-20251215"
TUNE_FEATURES        = "arm vfp cortexa7 neon vfpv4 thumb callconvention-hard"
TARGET_FPU           = "hard"
DISTRO_CODENAME      = "scarthgap"
GCCVERSION           = "13.%"
PREFERRED_PROVIDER_virtual/kernel = "linux-stm32mp"
meta-python          
meta-oe              
meta-gnome           
meta-multimedia      
meta-networking      
meta-webserver       = "HEAD:1235dd4ed4a57e67683c045ad76b6a0f9e896b45"
meta-st-stm32mp      = "HEAD:69a81db920e98ff3e3922f59eecbc50d91c31299"
meta-st-openstlinux  = "HEAD:a25d4806880cdc73471e3c1824a87901b5a4e44f"
meta                 = "HEAD:236ac1b43308df722a78d3aa20aef065dfae5b2b"
meta-engicam-st      = "scarthgap-6.6_v24.12:a76276fad7d4ffd209f695d8633029539a8bc6ad"
```



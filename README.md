meta-engicam-st
================

Based on STM32MPU Distribution Package 

	openstlinux-6.1-yocto-mickledore-mpu-v24.06.26

Retrieve the sources
--------------------

```
mkdir openstlinux-6.1-yocto-mickledore-mpu-v24.06.26
cd openstlinux-6.1-yocto-mickledore-mpu-v24.06.26
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-6.1-yocto-mickledore-mpu-v24.06.26
repo sync
```

BSP meta-layers repositories:

**meta-openembedded**
remote="http://git.openembedded.org/meta-openembedded"
path="layers/meta-openembedded"
revision="aa5e8edabbc414d8ec1b2ad63c8743c7baf99626"

**bitbake**
remote="http://git.openembedded.org/bitbake"
path="layers/openembedded-core/bitbake"
revision="c7e094ec3beccef0bbbf67c100147c449d9c6836"

**openembedded-core**
name="http://git.openembedded.org/openembedded-core"
path="layers/openembedded-core"
revision="23b5141400b2c676c806df3308f023f7c04e34e0"

**meta-st-openstlinux**
remote="https://github.com/STMicroelectronics/meta-st-openstlinux"
path="layers/meta-st/meta-st-openstlinux"
revision="2636960b2bead3d1cb294e378e2b06ef8997189e"

**meta-st-stm32mp**
remote="https://github.com/STMicroelectronics/meta-st-stm32mp"
path="layers/meta-st/meta-st-stm32mp"
revision="1f152e07019dc06fd331b4926ec7e76ceae3d259"

**meta-st-stm32mp-addons**
remote="https://github.com/STMicroelectronics/meta-st-stm32mp-addons"
path="layers/meta-st/meta-st-stm32mp-addons"
revision="b762caac2e38cf39bcf261d37a79db15a21dfdcc"

**meta-st-scripts**
remote="https://github.com/STMicroelectronics/meta-st-scripts"
path="layers/meta-st/scripts"
revision="ba56d9daf0174498f2a96cecec0a4864a650444e"

Ex. First build
-----------

```
DISTRO=openstlinux-weston MACHINE=stm32mp25-icore source layers/meta-st/scripts/envsetup.sh -b build
bitbake-layers add-layer ../sources/meta-engicam-st
bitbake st-image-weston
```


# meta-engicam-st

Engicam BSP meta-layer for STMicroelectronics STM32MP platforms, based on the STM32MPU OpenSTLinux Distribution Package `openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05`.

---

## Supported hardware

### STM32MP1 series (Cortex-A7)

| Machine | SoC | Module | Supported boards |
|---|---|---|---|
| `stm32mp15-icore` | STM32MP157A | iCore STM32MP1 | Capacitive Starter Kit EDIMM 2.0 |
| `stm32mp15-ugea` | STM32MP157A | MicroGEA STM32MP1 | MicroDev Starter Kit |
| `stm32mp13-ugea` | STM32MP135D | MicroGEA STM32MP1 | MicroDev Starter Kit |

### STM32MP2 series — STM32MP257 (Cortex-A35)

> Requires `ACCEPT_EULA_<machine> = "1"` in `local.conf` to enable GPU features.

| Machine | SoC | Module | Supported boards |
|---|---|---|---|
| `stm32mp25f-icore` | STM32MP257F | iCore STM32MP2 | Capacitive Starter Kit EDIMM 2.0 |
| `stm32mp25d-icore` | STM32MP257D | iCore STM32MP2 | EDIMM 2.0, C.Touch 2 (Ampire 10"), C.Touch 2 (Yes 7"), C.Touch (Ampire 7") |
| `stm32mp25d-smarcore` | STM32MP257D | SmarCore STM32MP2 | X.Touch 10 |
| `stm32mp25f-ugea` | STM32MP257F | MicroGEA STM32MP2 | Micro5, MicroTouch |
| `stm32mp25d-ugea` | STM32MP257D | MicroGEA STM32MP2 | Capacitive Starter Kit EDIMM 2.0 (with EDIMM adapter) |

### STM32MP2 series — STM32MP235 (Cortex-A35)

> Uses FIP BL31 boot and NXP8987 SDIO Wi-Fi module.

| Machine | SoC | Module | Supported boards |
|---|---|---|---|
| `stm32mp23d-icore` | STM32MP235D | iCore STM32MP2 | Capacitive Starter Kit EDIMM 2.0 |
| `stm32mp23d-ugea` | STM32MP235D | MicroGEA STM32MP2 | Micro5, MicroDev3, MicroTouch |

---

## Available images

| Image | Description |
|---|---|
| `st-image-weston` | ST BSP image with Wayland/Weston backend and Qt support |
| `st-image-core` | Minimal BSP image |

---

## Prerequisites

Build host: 12 GB RAM or more, 4+ CPU cores.

---

## Retrieve the BSP sources

```bash
mkdir openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
cd openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
repo init -u https://github.com/STMicroelectronics/oe-manifest.git \
  -b refs/tags/openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
repo sync
```

From commit "__stm32mp257 Icore: enabled ethernet switch__" (b16fdcc3ed5f7a9e2377ed3723844b2f1ebd7b76) also needed
- [meta-st-stm32mp-tsn-swch](https://github.com/STMicroelectronics/meta-st-stm32mp-tsn-swch)
- [meta-st-stm32mp-tsn-acm](https://github.com/STMicroelectronics/meta-st-stm32mp-tsn-acm)
Both on branch scarthgap branch
---

## Add meta-engicam-st

Clone the layer into the BSP layers directory:

```bash
cd layers/
git clone https://github.com/engicam-stable/meta-engicam-st.git \
  -b scarthgap-6.6_v24.12
```

If the layer already exists, update it:

```bash
cd layers/meta-engicam-st/
git pull origin scarthgap-6.6_v24.12
```

---

## Set up the build environment

Create a symlink to the ST environment script:

```bash
ln -s layers/meta-st/scripts/envsetup.sh envsetup.sh
```

Initialize a build directory — replace `<machine>` and `<build-dir>` with the values for your target:

```bash
DISTRO=openstlinux-weston MACHINE=<machine> source envsetup.sh <build-dir>
```

Example for iCore STM32MP257F:

```bash
DISTRO=openstlinux-weston MACHINE=stm32mp25f-icore source envsetup.sh build-icore
```

If the build directory already exists from a previous run:

```bash
source envsetup.sh
```

### `conf/bblayers.conf`

Add to `BASELAYERS`:

```bash
BASELAYERS += " \
    ${OEROOT}/layers/meta-openembedded/meta-oe \
    ${OEROOT}/layers/meta-openembedded/meta-python \
    ${OEROOT}/layers/meta-engicam-st \
"
```

### `conf/local.conf`

**STM32MP257 only** — accept the EULA to enable GPU/OpenCL/Vulkan features:

```bash
ACCEPT_EULA_<machine> = "1"
# e.g. for stm32mp25f-icore:
ACCEPT_EULA_stm32mp25f-icore = "1"
```

---

## Build

```bash
bitbake st-image-weston
```

---

## Flash to SD card

After a successful build, images are in:

```
<build-dir>/tmp-glibc/deploy/images/<machine>/
```

Move to the `scripts/` subdirectory and generate the `.raw` image:

```bash
./create_sdcard_from_flashlayout.sh ../flashlayout_<image>/optee/FlashLayout_sdcard_<dt>-mx-optee.tsv
```

Then flash:

```bash
sudo dd if=../FlashLayout_sdcard_<dt>-mx-optee.raw of=/dev/sdX bs=8M conv=fdatasync status=progress
```

Use `lsblk` to identify the correct device.

### Device tree names per machine

| Machine | Device tree (`<dt>`) |
|---|---|
| `stm32mp13-ugea` | `stm32mp135d-ugea-microdev-mx` |
| `stm32mp15-icore` | `stm32mp157a-icore-starterkit2-mx` |
| `stm32mp15-ugea` | `stm32mp157a-ugea-microdev-mx` |
| `stm32mp25f-icore` | `stm32mp257f-icore-edimm2-mx` |
| `stm32mp25d-icore` | `stm32mp257d-icored-edimm2-mx` (default), `stm32mp257d-icored-ctouch2-amp10`, `stm32mp257d-icored-ctouch2-yes7`, `stm32mp257d-icored-ctouch-ampire7` |
| `stm32mp25d-smarcore` | `stm32mp257d-smarcored-xtouch10-mx` |
| `stm32mp25f-ugea` | `stm32mp257f-ugea-micro5-mx` (default), `stm32mp257f-ugea-microtouch` |
| `stm32mp25d-ugea` | `stm32mp257d-ugea-micro5-mx` (default), `stm32mp257d-ugea-edimm2` |
| `stm32mp23d-icore` | `stm32mp235d-icore-edimm2-mx` |
| `stm32mp23d-ugea` | `stm32mp235d-ugead-micro5-mx` (default), `stm32mp235d-ugead-microdev3`, `stm32mp235d-ugea-microtouch` |

### MP1 note — FlashLayout path

For `stm32mp15-icore` and `stm32mp15-ugea` the FlashLayout is under `trusted/` and uses the `mx-trusted` suffix:

```bash
./create_sdcard_from_flashlayout.sh \
  ../flashlayout_st-image-weston/trusted/FlashLayout_sdcard_stm32mp157a-icore-starterkit2-mx-trusted.tsv
```

For `stm32mp13-ugea` (optee boot):

```bash
./create_sdcard_from_flashlayout.sh \
  ../flashlayout_st-image-weston/FlashLayout_sdcard_stm32mp135d-ugea-microdev-mx-optee.tsv
```

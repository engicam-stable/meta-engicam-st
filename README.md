This README file contains information on the contents of the meta-engicam-st layer.

The meta-engicam-st is a BSP layer for Engicam SOM equipped with STMicroelectronics processors. For more info about the available SOM:

* **https://www.engicam.com/** 

Dependencies
============

meta-engicam-st is based on OpenSTLinux ditribution package for Yocto dunfell 5.10:

URI: **http://git.openembedded.org** 

| layer    	    |      	   path		        |		  commit		   |
|-------------------|:---------------------------------:|-----------------------------------------:|
| bitbake  	    |  layers/openembedded-core/bitbake | 0e0af15b84e07e6763300dcd092b980086b9b9c4 |
| meta-openembedded |      layers/meta-openembedded     | c38d2a74f762a792046f3d3c377827b08aade513 |
| openembedded-core |  	   layers/openembedded-core     | ac8181d9b9ad8360f7dba03aba8b00f008c6ebb4 |

URI: **https://github.com/STMicroelectronics**

| 	layer            |      	   path		     	  |		  commit		     |
|------------------------|:--------------------------------------:|-----------------------------------------:|
|  meta-st-openstlinux	 | layers/meta-st/meta-st-openstlinux     | 3d772ac02e01e1a76e6888fcabb2d5fa26f1c579 |
|   meta-st-stm32mp      |   layers/meta-st/meta-st-stm32mp       | 816fd629ab31700a5c08442b29f6906e95c31df0 |
| meta-st-stm32mp-addons | layers/meta-st/meta-st-stm32mp-addons  | 81065195a63e98be8f423ab422960e9d7896f4d5 |
|    meta-st-scripts	 | 	layers/meta-st/scripts 	          | d2ba39bc40952ff6eb06d2b0e496910a74209660 |

URI: **https://github.com**

| 	layer            |      	   path		     	  |		  commit		     |
|------------------------|:--------------------------------------:|-----------------------------------------:|
|  meta-qt5/meta-qt5	 |            layers/meta-qt5	          | b4d24d70aca75791902df5cd59a4f4a54aa4a125 |

Patches
=======

Please submit any patches against the meta-engicam-st layer to the Engicam support mailing list (support@engicam.com)
 

Table of Contents
=================

   I. Available MACHINE
  II. Adding the meta-engicam-st layer to your build
 III. Distro and Images


I. Available MACHINE
====================

* **stm32mp1-ugea512**:
Configuration file for MicorGEA STM32MP1 on MicroDev 2.0 Carrier Board. 

II. Adding the meta-engicam-st layer to your build
=================================================

Run 'bitbake-layers add-layer meta-engicam-st'

III. Distro and Images
======================
For a quick start image with the OpenStLinux bsp compile * **st-image-weston** for distribution * **openstlinux-weston**

flash_erase /dev/mtd0 0 0
flash_erase /dev/mtd1 0 0
flash_erase /dev/mtd2 0 0
flash_erase /dev/mtd3 0 0
nandwrite -p /dev/mtd0 /tf-a-stm32mp157a-ugea512-mx-nand.stm32
nandwrite -p /dev/mtd1 /fip-stm32mp157a-ugea512-mx-trusted.bin
nandwrite -p /dev/mtd2 /fip-stm32mp157a-ugea512-mx-trusted.bin
ubiformat /dev/mtd3 -f /tmp/engicam-test-image-openstlinux-weston-stm32mp1-ugea512_nand_4_256_multivolume.ubi

ubiformat /dev/mtd3
ubiattach /dev/ubi_ctrl -m 3

root@stm32mp1-ugea512:~# ubiformat /dev/mtd3 -f /tmp/ingenioplus-image-openstlinux-weston-stm32mp1-ingenioplus-nand_nand_4_256_multivolume.ubi 
ubiformat: mtd3 (nand), size 526385152 bytes (502.0 MiB), 2008 eraseblocks of 262144 bytes (256.0 KiB), min. I/O sizes
libscan: scanning eraseblock 2007 -- 100 % complete  
ubiformat: 2008 eraseblocks are supposedly empty
ubiformat: flashing eraseblock 549 -- 100 % complete  
ubiformat: formatting eraseblock 2007 -- 100 % complete  
root@stm32mp1-ugea512:~# ubiattach /dev/ubi_ctrl -m 3
[  143.269179] ubi0: attaching mtd3
[  145.239519] ubi0: scanning is finished
[  145.262275] ubi0: volume 3 ("rootfs") re-sized from 492 to 1884 LEBs
[  145.274984] ubi0: attached mtd3 (name "UBI", size 502 MiB)
[  145.281450] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
[  145.288198] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
[  145.293559] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
[  145.302673] ubi0: good PEBs: 2008, bad PEBs: 0, corrupted PEBs: 0
[  145.324726] ubi0: user volume: 4, internal volumes: 1, max. volumes count: 128
[  145.335452] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 455354898
[  145.344511] ubi0: available PEBs: 0, total reserved PEBs: 2008, PEBs reserved for bad PEB handling: 40
[  145.353982] ubi0: background thread "ubi_bgt0d" started, PID 843
UBI device number 0, total 2008 LEBs (509935616 bytes, 486.3 MiB), available 0 LEBs (0 bytes), LEB size 253952 bytes )

mount /dev/ubi0_2 /mnt

root@stm32mp1-ugea512:~# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00200000 00040000 "fsbl"
mtd1: 00400000 00040000 "fip1"
mtd2: 00400000 00040000 "fip2"
mtd3: 1f600000 00040000 "UBI"

mtdinfo /dev/mtd3 -u

mtd3
Name:                           UBI
Type:                           nand
Eraseblock size:                262144 bytes, 256.0 KiB
Amount of eraseblocks:          2008 (526385152 bytes, 502.0 MiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  4096 bytes
OOB size:                       224 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true
Default UBI VID header offset:  4096
Default UBI data offset:        8192
Default UBI LEB size:           253952 bytes, 248.0 KiB
Maximum UBI volumes count:      128

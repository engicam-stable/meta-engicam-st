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



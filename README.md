This README file contains information on the contents of the meta-engicam-st layer.

The meta-engicam-st is a BSP layer for Engicam SOM equipped with STMicroelectronics processors. For more info about the available SOM:

* **https://www.engicam.com/** 

Dependencies
============

meta-engicam-st is based on OpenSTLinux ditribution package for Yocto Kirkstone 5.15:

```
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15
repo sync
```


URI: **http://git.openembedded.org** 

| layer    	    |      	   path		        |		  commit		   |
|-------------------|:---------------------------------:|-----------------------------------------:|
| bitbake  	    |  layers/openembedded-core/bitbake | b8fd6f5d9959d27176ea016c249cf6d35ac8ba03 |
| meta-openembedded |      layers/meta-openembedded     | fb7b26b0fb243620f52a61296f4eda6af6ad1af6 |
| openembedded-core |  	   layers/openembedded-core     | eea52e0c3d24c79464f4afdbc3c397e1cb982231 |

URI: **https://github.com/STMicroelectronics**

| 	layer            |      	   path		     	  |		  commit		     |
|------------------------|:--------------------------------------:|-----------------------------------------:|
|  meta-st-openstlinux	 | layers/meta-st/meta-st-openstlinux     | cbb3a2e059ca8c66c39cf6c07dc951e793ed2592 |
|   meta-st-stm32mp      |   layers/meta-st/meta-st-stm32mp       | 00c2494b66b8fa2c0fc2008fa802a2adbeed966e |
| meta-st-stm32mp-addons | layers/meta-st/meta-st-stm32mp-addons  | b0b00bc662719341d9ba69460aed03e2bb9ac833 |
|    meta-st-scripts	 | 	layers/meta-st/scripts 	          | 9d87d2ddd0542f67e1f57a543ac5a70bef11f44e |

URI: **https://github.com**

| 	layer            |      	   path		     	  |		  commit		     |
|------------------------|:--------------------------------------:|-----------------------------------------:|
|  meta-qt5/meta-qt5	 |            layers/meta-qt5	          | 5b71df60e523423b9df6793de9387f87a149ac42 |

Patches
=======

Please submit any patches against the meta-engicam-st layer to the Engicam support mailing list (support@engicam.com)
 

Table of Contents
=================

   I. Available MACHINE
  II. Distro and Images


I. Available MACHINE
====================

* **stm32mp13-ugea**:
Configuration file for MicorGEA STM32MP13 on MicroDev 2.0 Carrier Board. 

* **stm32mp13-gea**:
Configuration file for MicorGEA STM32MP13 on MicroDev 2.0 Carrier Board. 

II. Distro and Images
======================
For a quick start image with the OpenStLinux bsp compile * **st-image-weston** for distribution * **openstlinux-weston**

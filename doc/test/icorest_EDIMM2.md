**Test sheet**

**Version:** 1.0


**Preliminary**

Creation of engicam-test-hw image for sdcard booting and same image for nand programming.

--------------------------------------------------------------------------------------------------------

**Board Type:** Capacitive Starter Kit EDIMM 2.0

**SOM Type:**  iCoreSTM32MP1

--------------------------------------------------------------------------------------------------------

**U-BOOT**

**Version:**

**Tests**

| Status  |  Test |
|---------|-------|
| TBT   |Nand Enviroment saving   |
| OK    |Sdcard  Enviroment saving |
| OK    |Emmc  Enviroment saving |
| TBT   |Ethernet  |
| TBT   |Boot from nand   |
| OK   |Boot from sdcard  |
| OK   |Boot from emmc  |
| TBT   |Nand flash Programming from ethernet   |
| TBT   |U-boot logo   |


**Tests NOTE:**

**Nand Enviroment saving  **

setenv serverip 192.168.2.69
saveenv
reset board
printenv  serverip

**Sdcard  Enviroment saving **

setenv serverip 192.168.2.69
saveenv
reset board
printenv  serverip

**Ethernet **

Nand flash programming done

**Boot from nand **

**Boot from sdcard **

**Nand flash Programming from ethernet**

ftp geam6ul/ker_dtb_fs.scr

**U-boot logo**
no logo showed

--------------------------------------------------------------------------------------------------------
**Kernel Linux**

| Status  |  Test |
|---------|-------|
|OK |Ethernet|
|OK |MAC Address|
|OK |USB|
|OK |MMC card|
|TBT |Display|
|TBT |Second Ethernet|
|TBT |CMOS Input|
|OK  |UART 232|
|OK  |UART 485|
|OK |Linux Console|
|OK |CANBUS1|
|OK |CANBUS2|
|TBT |HDMI|
|OK |Touchscreen|
|TBT |Audio|
|TBT |USB  OTG|
|TBT |SATA|
|TBT |PCI Express|
|TBT |LVDS 0|
|TBT |LVDS 1|
|OK |Backlight Control|
|TBT |Kobs-ng for u-boot programmnig|
|TBT |Test VPU|
|TBT |Test GPU|
|OK |WIFI|
|OK |Bluetooth|

**Tests NOTE:**

**Ethernet**

ping 192.168.2.13

**MAC Address**

With ifconfig same of ethaddr on uboot

**USB**

mount /dev/sda1 /mnt

dd if=/dev/zero of=/mnt/bigfile bs=1024 count=102400

dd if=/dev/zero of=/mnt/bigfile2 bs=1024 count=102400

cmp /mnt/bigfile /mnt/bigfile2

**MMC Card**

mount /dev/mmcblk0p6 /mnt/
dd if=/dev/zero of=/mnt/bigfile bs=1024 count=102400

dd if=/dev/zero of=/mnt/bigfile2 bs=1024 count=1024

**UART 232**

Short circuit pin 1 and 2 of connector J30

Open minicom on /dev/ttySTM1

Check that the written character are displayed on terminal 

**UART 485**

Open minicom on /dev/ttySTM2 on both tested board and auxiliary board

Check that both boards can send and receive text on minicom

**CANBUS1**

 Configure the bit rate on target:
/ # ip link set can0 type can bitrate 125000
 Enable the interface on target:
/ # ifconfig can0 up
 To send a frame:
/ # cansend can0 123#1122334455667788
 To receive a frame:
/ # candump can0

**CANBUS2**

 Configure the bit rate on target:
/ # ip link set can1 type can bitrate 125000
 Enable the interface on target:
/ # ifconfig can1 up
 To send a frame:
/ # cansend can1 123#1122334455667788
 To receive a frame:
/ # candump can1

**Touchscreen**

With Wayland 

**Audio**

playring.sh

playleftright.sh

**Backlight Control**

echo 1 > /sys/class/backlight/panel-backlight/brightness
ok
echo 0 > /sys/class/backlight/panel-backlight/brightness

**Audio**

playring.sh

playleftright.sh

**Kobs-ng for u-boot programming**

Tested with script: prboot.sh

**Test VPU**
gplay of big buck bunny

**Test GPU**
Launch of demo-qt-application

**WIFI**
ifconfig eth0 down
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ifconfig wlan0 up
iw dev wlan0 scan | grep SSID
wpa_passphrase SSID password > /etc/wpa_supplicant.conf
wpa_supplicant -iwlan0 -Dnl80211 -c/etc/wpa_supplicant.conf -B
udhcpc -i wlan0

**Bluetooth**
systemctl start bluetooth
brcm_patchram_plus --patchram /lib/firmware/brcm/BCM43430A1.hcd --enable_hci --no2bytes --tosleep 1000 --baudrate 3000000 --use_baudrate_for_download /dev/ttyUSB0 &
hciconfig hci0 up
bluetoothctl
agent on
scan on

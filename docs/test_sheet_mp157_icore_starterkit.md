---
board: starterkit
module: mp157_icore
---

# Test Sheet iCore STM32MP157 — EDIMM Starterkit 2.0

![image](images/board_starterkit_edimm2.png)

---

## Kernel

| Status | Test              | Notes      |
|--------|-------------------|------------|
| OK     | Ethernet          |            |
| OK     | USB               |            |
| OK     | MMC card          |            |
| OK     | EMMC Flash        |            |
| OK     | NAND Flash        |            |
| TBT    | Display           |            |
| TBT    | UART 232          | `ttySTM1`  |
| TBT    | UART 485          | `ttySTM2`  |
| OK     | Linux Console     | `ttySTM0`  |
| TBT    | CANBUS1           |            |
| TBT    | CANBUS2           |            |
| OK     | WIFI              |            |
| OK     | Bluetooth         |            |
| TBT    | Touchscreen       |            |
| OK     | Backlight Control |            |

---

## UART 232

On `J21` connector close TX with RX and use minicom on `ttySTM1` to test local echo.

---

## UART 485

Tested `/dev/ttySTM2` (connector `J22`) with another RS485 device. Configure minicom:

```bash
minicom -s
```

Configure the Serial Port Setup as shown:

![RS485 minicom config](images/minicom_rs485_conf.png)

---

## Wi-Fi

```bash
ifconfig eth0 down
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ifconfig wlan0 up
iw dev wlan0 scan | grep SSID
wpa_passphrase SSID password > /etc/wpa_supplicant.conf
wpa_supplicant -iwlan0 -Dnl80211 -c/etc/wpa_supplicant.conf -B
udhcpc -i wlan0
```

---

## Bluetooth

```bash
brcm_patchram_plus --patchram /lib/firmware/brcm/BCM43430A1.hcd --enable_hci \
--no2bytes --tosleep 1000 --baudrate 3000000 \
--use_baudrate_for_download /dev/ttyUSB0 &

hciconfig hci0 up
bluetoothctl
agent on
scan on
```

---

## CAN Interfaces

Connect the CANBUS connectors J23 and J24.

```bash
ip link set can0 type can bitrate 125000
ip link set can1 type can bitrate 125000
ifconfig can0 up
ifconfig can1 up

cansend can0 123#1122334455667788
candump can0

cansend can1 123#1122334455667788
candump can1
```

---

## Backlight Control

```bash
echo 1 > /sys/class/backlight/panel-backlight/brightness
echo 0 > /sys/class/backlight/panel-backlight/brightness
```

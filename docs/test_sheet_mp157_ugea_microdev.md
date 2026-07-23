---
board: microdev
module: mp157_ugea
---

# Test Sheet MicroGea STM32MP157 — MicroDev

![image](images/board_microdev.png)

---

## Kernel

| Status | Test              | Notes      |
|--------|-------------------|------------|
| OK     | Ethernet          |            |
| OK     | USB               |            |
| OK     | Nand              |            |
| TBT    | Display           |            |
| TBT    | UART 232          | `ttySTM1`  |
| TBT    | UART 485          | `ttySTM2`  |
| OK     | Linux Console     | `ttySTM0`  |
| TBT    | CANBUS1           | `can0`     |
| TBT    | Touchscreen       |            |
| TBT    | Backlight Control |            |
| OK     | WIFI              |            |
| OK     | Bluetooth         |            |
| OK     | UMTS              |            |

---

## UART 232

Connect TX/RX PIN connector to the UART 232 port on `J31`. From terminal run minicom:

```bash
minicom -s
```

Disable Hardware Flow Control and set `Serial Device` to `/dev/ttySTM1`. Check that characters typed from keyboard are echoed in the terminal.

---

## UART 485

Tested `/dev/ttySTM2` with another RS485 device. Configure minicom:

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
systemctl start bluetooth
brcm_patchram_plus --patchram /lib/firmware/brcm/BCM43430A1.hcd --enable_hci \
--no2bytes --tosleep 1000 --baudrate 3000000 \
--use_baudrate_for_download /dev/ttySTM3 &

hciconfig hci0 up
bluetoothctl
agent on
scan on
```

---

## CAN Interfaces

Connect CANBUS pins on `J2` to a compatible transceiver.

```bash
ip link set can0 type can bitrate 125000
ifconfig can0 up

cansend can0 123#1122334455667788
candump can0
```

---

## Backlight Control

```bash
echo 7 > /sys/class/backlight/panel-backlight/brightness
echo 0 > /sys/class/backlight/panel-backlight/brightness
```

---

## Touchscreen

```bash
evtest
```

Expected output:

```
Available devices:
/dev/input/event0:      EP0420M09
Select the device event number [0-0]
```

Press `0` and Enter, then touch the screen.

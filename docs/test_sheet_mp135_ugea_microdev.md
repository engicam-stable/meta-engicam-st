---
board: microdev
module: mp135_ugea
---

# Test Sheet MicroGea STM32MP135 — MicroDev

![image](images/board_microdev.png)

---

## Kernel

| Status | Test              | Notes      |
|--------|-------------------|------------|
| OK     | Ethernet          |            |
| OK     | USB               |            |
| OK     | eMMC              |            |
| TBT    | Display           |            |
| TBT    | UART 232          | `ttySTM1`  |
| TBT    | UART 485          | `ttySTM2`  |
| OK     | Linux Console     | `ttySTM0`  |
| TBT    | CANBUS1           | `can0`     |
| TBT    | Touchscreen       |            |
| TBT    | Backlight Control |            |
| N/A    | WIFI              |            |
| N/A    | Bluetooth         |            |
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

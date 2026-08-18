---
board: microtouch
module: mp235_ugea
---

# Test Sheet MicroGea STM32MP235 — MicroTouch

<!--![image](images/board_microdev.png)-->

---

## Kernel

| Status | Test              | Notes      |
|--------|-------------------|------------|
| OK     | Sd Card           | Booted with JM1 closed |
| OK     | Emmc              | Booted with JM1 open |
| OK     | Display           | Please see [Note-Display](#note-display) |
| OK     | Backlight         | Please see [Note-Backlight](#note-backlight) |
| OK     | Touchscreen       | Please see [Note-Touchscreen](#note-touchscreen)|
| OK     | Ethernet          | Please see [Note-Ethernet](#note-ethernet) |
| TBT    | Wifi              | U7 DNP |
| TBT    | BT                | U7 DNP |
| OK     | Console (J9)      | Opened with minicom |
| OK     | RS232 (J31)       | Please see [Note-RS232](#note-rs232) |
| OK     | RS485 (J32)       | Please see [Note-RS485](#note-rs485) |
| OK     | CAN (J33)         | Please see [Note-CAN](#note-can) |
| OK     | USB               | Tested with USB-stick |
| OK     | Eeprom            | Please see [Note-EEPROM](#note-reprom) |
| TBT    | TPM               | U5 DNP |
| OK     | RTC               | Please see [Note-RTC](#note-rtc) |
| TBT    | Strip connector   | Please see [Note-Strip-Connector](#note-strip-connector) |

---

## Note RTC 
```bash
timedatectl set-ntp off
date -s "2000-01-01"
hwclock -w -f /dev/rtc0
sync

# Turn off the system and power it back on. Once it booted check that the date is the same:

hwclock 
```

---

## Note Ethernet
```bash
ping -I end0 8.8.8.8
```

---

## Note RS232
Connect TX/RX PIN connector to the UART 232 port on `J31`
```bash
minicom -s 
```
Disable Hardware Flow Control and set `Serial Device` to `/dev/ttySTM3`. Check that characters typed from keyboard are echoed in the terminal.

---

## Note RS485
Tested `/dev/ttySTM1` with another RS485 device. Configure minicom:
```bash
minicom -s
```
Configure the Serial Port Setup as shown:
![RS485 minicom config](images/minicom_rs485_conf.png)

---

## Note CAN
Connect CANBUS pins on `J33` to a compatible transceiver.
```bash
ip link set can0 type can bitrate 125000
ifconfig can0 up

cansend can0 123#1122334455667788
candump can0
```

---

## Note Display
```bash
export XDG_RUNTIME_DIR=/home/weston
export WAYLAND_DISPLAY=wayland-1
gst-launch-1.0 videotestsrc ! video/x-raw,width=1024,height=600 ! videoconvert ! waylandsink
```

---

## Note Backlight
```bash
echo 0 > /sys/class/backlight/panel-backlight/brightness
echo 1 > /sys/class/backlight/panel-backlight/brightness
```

---

## Note Touchscreen

```bash
evtest
# Select
# /dev/input/event0:      EP0430M09
```

---

## Note Reprom
```bash
# WRITE with
echo "EEPROM_TEST_123" | tee /sys/bus/i2c/devices/0-0053/eeprom
EEPROM_TEST_123
# READ with
head -c 16 /sys/bus/i2c/devices/0-0053/eeprom
EEPROM_TEST_123
```

## Note Strip Connector
### UART_EXT 
Close pins 1-2 on J2.  
```bash
minicom -s 
```
Disable Hardware Flow Control and set `Serial Device` to `/dev/ttySTM4`. Check that characters typed from keyboard are echoed in the terminal.  

### CAN_EXT
Not tested - stm32mp235 does not support 2 can interfaces.  

### USB_EXT
Not tested - Not populated on board.  

### GPIO_I2C 
Close pins 10-11 on J2.  
```bash
gpioset GPIO4_I2C_SCL=0 &
gpioget GPIO3_I2C_SDA
# Reads: "GPIO3_I2C_SDA"=inactive

gpioset GPIO3_I2C_SDA=1 &
gpioget GPIO4_I2C_SCL
# Reads: "GPIO4_I2C_SCL"=active


### GPIO_EXT
Close pins 13-14 on J2.  
```bash
gpioset GPIO1=0 &
gpioget GPIO2
# Reads: "GPIO2"=inactive

gpioset GPIO2=1 &
gpioget GPIO1
# Reads: "GPIO1"=active
```


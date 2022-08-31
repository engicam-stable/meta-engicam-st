#!/bin/bash
echo "###Partitioning emmc###"
#!/bin/bash

umount /dev/mmcblk1p*

mmc bootbus set single_backward x1 x1 /dev/mmcblk1

echo 0 > /sys/block/mmcblk1boot0/force_ro
dd if=tf-a.stm32 of=/dev/mmcblk1boot0 conv=fdatasync
mmc bootpart enable 1 1 /dev/mmcblk1

echo 0 > /sys/block/mmcblk1boot1/force_ro
dd if=tf-a.stm32 of=/dev/mmcblk1boot1 conv=fdatasync
mmc bootpart enable 2 1 /dev/mmcblk1

sgdisk -o /dev/mmcblk1
sgdisk -l gpt-emmc.tbl /dev/mmcblk1
sgdisk -p /dev/mmcblk1

echo "###Partitioning emmc Done###"
echo "###Programming emmc###"

dd if=/dev/zero of=/dev/mmcblk1p1 conv=fdatasync
dd if=fip.bin of=/dev/mmcblk1p1 bs=1M conv=fdatasync

mkfs.ext4 -O ^metadata_csum,^dir_index -F /dev/mmcblk1p2
mkfs.ext4 -F /dev/mmcblk1p3
mkfs.ext4 -F /dev/mmcblk1p4
mkfs.ext4 -F /dev/mmcblk1p5

mkdir -p /media/mmcblk1p2
mkdir -p /media/mmcblk1p3
mkdir -p /media/mmcblk1p4
mkdir -p /media/mmcblk1p5
mount /dev/mmcblk1p2 /media/mmcblk1p2
mount /dev/mmcblk1p3 /media/mmcblk1p3
mount /dev/mmcblk1p4 /media/mmcblk1p4
mount /dev/mmcblk1p5 /media/mmcblk1p5

echo "Fill bootfs   ..."
tar -xvf st-image.bootfs.tar.xz -C /media/mmcblk1p2/ 2>&1 >/dev/null
echo "Fill vendorfs ..."
tar -xvf st-image.vendorfs.tar.xz -C /media/mmcblk1p3/ 2>&1 >/dev/null
echo "Fill rootfs   ..."
tar -xvf st-image.rootfs.tar.xz -C /media/mmcblk1p4/ 2>&1 >/dev/null
echo "Fill userfs   ..."
tar -xvf st-image.userfs.tar.xz -C /media/mmcblk1p5 2>&1 >/dev/null
#echo "Copying weston.ini   ..."
#cp weston.ini /media/mmcblk1p4/etc/xdg/weston/

echo "sync ..."
sync
sleep 1
echo "###Programming emmc Done###"

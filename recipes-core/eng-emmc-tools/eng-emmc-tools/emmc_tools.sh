#!/bin/bash
# EMMC programmer

ver="ver. 1.0, 2022-09-7"

part_metadata1="p1" #Partition metadata1
part_metadata2="p2" #Partition metadata2
part_fip1="p3" #Partition fip-a
part_fip2="p4" #Partition fip-b
part_bootfs="p6" #Partition bootfs
part_vendorfs="p7" #Partition vendorfs
part_rootfs="p8" #Partition rootfs
part_userfs="p9" #Partition userfs


function check_file
{
	if [ ! -f $1 ];
	then
		echo "ERROR: file $1 not found"
		exit
	fi
}

function create_emmc
{
umount $1
echo "###delete old emmc partition table###"
dd if=/dev/zero of=$1 bs=1M count=1
wipefs --all --force -q $1
echo "###Partitioning emmc###"

sgdisk -o $1
sgdisk -l $2 $1
error $?
sgdisk -p $1


echo "###Partitioning emmc Done###"

sync
}

function error
{
	if [ "$1" != "0" ];
	then

		if [ "$2" != "" ];
		then
			echo "ERROR: $2"
		fi

		exit
	fi
}

function usage
{
	echo -e "$1: $ver\n"
	path="<path of directory with files>"
  path_gpt="<partition table file with complete path>"

	if [ "$1" == "emmc_tfa" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
	fi

	if [ "$1" == "emmc_tfa_metadata" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
	fi

	if [ "$1" == "emmc_fip" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
	fi

	if [ "$1" == "emmc_bootfs_fs" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
		echo ""
		echo "WARNING: This script do not create a new filesystem for the bootfs partition as this operation would delete the u-boot environment section"
		echo "If you need to create a file system for the bootfs partition run the following command before the script:"
		echo "mkfs.ext4 -O ^metadata_csum,^dir_index -F /dev/mmcblk1p6"
		echo ""
	fi

	if [ "$1" == "emmc_rootfs" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
	fi

	if [ "$1" == "emmc_full_image" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path [-p] $path_gpt"
		echo ""
		echo "Example: emmc_full_image.sh /dev/mmcblk1 /files_emmc -p /usr/share/eng-emmc-tools/gpt-emmc"
		echo ""
		echo "Options:

		-h show this help message
		-p specify a gpt partition table for emmc

		Specify /usr/share/eng_emmc_tools/gpt-emmc to use the following gpt:

		Number  Start (sector)    End (sector)  Size       Code  Name
		   1            1024            2047   512.0 KiB   8301  metadata1
		   2            2048            3071   512.0 KiB   8301  metadata2
		   3            3072           11263   4.0 MiB     FFFF  fip-a
		   4           11264           19455   4.0 MiB     FFFF  fip-b
		   5           19456           20479   512.0 KiB   8301  u-boot-env
		   6           20480          151551   64.0 MiB    8300  bootfs
		   7          151552          184319   16.0 MiB    8300  vendorfs
		   8          184320         1691647   736.0 MiB   8300  rootfs
		   9         1691648         3145694   710.0 MiB   8300  userfs
	  "
		echo ""
		echo "ATTENTION: be aware that the current script will format the bootfs partition, resetting the U-boot environment"
		echo ""
	fi
	echo -e "\nThe order of the options is important!\n"
	exit
}

function write_tf-a
{

  boot0_part=${1:5}"boot0" # Es. from /dev/mmcblk1 get the mmcblk1boot0
  boot1_part=${1:5}"boot1"

  mmc bootbus set single_backward x1 x1 $1

  echo 0 > /sys/block/$boot0_part/force_ro
  dd if=$2 of=$1"boot0" conv=fdatasync
  mmc bootpart enable 1 1 $1

  echo 0 > /sys/block/$boot1_part/force_ro
  dd if=$2 of=$1"boot1" conv=fdatasync
  mmc bootpart enable 2 1 $1

  sync

	echo "Done"
}

function write_trusted_firmware_metadata
{

  dd if=/dev/zero of=$1$part_metadata1 conv=fdatasync
  dd if=$2 of=$1$part_metadata1 bs=1M conv=fdatasync

	dd if=/dev/zero of=$1$part_metadata2 conv=fdatasync
  dd if=$2 of=$1$part_metadata2 bs=1M conv=fdatasync

  sync

	echo "Done"
}

function write_fip
{

  dd if=/dev/zero of=$1$part_fip1 conv=fdatasync
  dd if=$2 of=$1$part_fip1 bs=1M conv=fdatasync

	dd if=/dev/zero of=$1$part_fip2 conv=fdatasync
  dd if=$2 of=$1$part_fip2 bs=1M conv=fdatasync

  sync

	echo "Done"
}

function write_rootfs
{


  mkfs.ext4 -F $1$part_rootfs
	error $?

  mkdir -p /media/p8

  mount $1$part_rootfs /media/p8

  echo "Fill rootfs   ..."
  tar -xvf $2 -C /media/p8/ 2>&1 >/dev/null

  sync
	umount /media/p8
	rm -rf /media/p8
	echo "Done"
}

function write_bootfs_fs
{

  mkfs.ext4 -F $1$part_vendorfs
	error $?
  mkfs.ext4 -F $1$part_rootfs
	error $?
  mkfs.ext4 -F $1$part_userfs
	error $?


  mkdir -p /media/p6
  mkdir -p /media/p7
  mkdir -p /media/p8
  mkdir -p /media/p9
  mount $1$part_bootfs /media/p6
	error $?
  mount $1$part_vendorfs /media/p7
	error $?
  mount $1$part_rootfs /media/p8
	error $?
  mount $1$part_userfs /media/p9
	error $?

  echo "Fill bootfs   ..."
	rm -rf /media/p6/*
  tar -xvf $2"bootfs.tar.xz" -C /media/p6/ 2>&1 >/dev/null
  echo "Fill vendorfs ..."
  tar -xvf $2"vendorfs.tar.xz" -C /media/p7/ 2>&1 >/dev/null
  echo "Fill rootfs   ..."
  tar -xvf $2"rootfs.tar.xz" -C /media/p8/ 2>&1 >/dev/null
  echo "Fill userfs   ..."
  tar -xvf $2"userfs.tar.xz" -C /media/p9 2>&1 >/dev/null

  sync
	umount /media/p6
	umount /media/p7
	umount /media/p8
	umount /media/p9
	rm -rf /media/p6
	rm -rf /media/p7
	rm -rf /media/p8
	rm -rf /media/p9
	echo "Done"
}

function write_full_image
{

  write_tf-a $1 $2"tf-a.stm32"
  write_fip $1 $2"fip.bin"
	write_trusted_firmware_metadata $1 $2"metadata.bin"

  mkfs.ext4 -O ^metadata_csum,^dir_index -F $1$part_bootfs
	error $?
  mkfs.ext4 -F $1$part_vendorfs
	error $?
  mkfs.ext4 -F $1$part_rootfs
	error $?
  mkfs.ext4 -F $1$part_userfs
	error $?

  mkdir -p /media/p6
  mkdir -p /media/p7
  mkdir -p /media/p8
  mkdir -p /media/p9
  mount $1$part_bootfs /media/p6
	error $?
  mount $1$part_vendorfs /media/p7
	error $?
  mount $1$part_rootfs /media/p8
	error $?
  mount $1$part_userfs /media/p9
	error $?

  echo "Fill bootfs   ..."
  tar -xvf $2"bootfs.tar.xz" -C /media/p6/ 2>&1 >/dev/null
  echo "Fill vendorfs ..."
  tar -xvf $2"vendorfs.tar.xz" -C /media/p7/ 2>&1 >/dev/null
  echo "Fill rootfs   ..."
  tar -xvf $2"rootfs.tar.xz" -C /media/p8/ 2>&1 >/dev/null
  echo "Fill userfs   ..."
  tar -xvf $2"userfs.tar.xz" -C /media/p9 2>&1 >/dev/null

  sync
	umount /media/p6
	umount /media/p7
	umount /media/p8
	umount /media/p9
	rm -rf /media/p6
	rm -rf /media/p7
	rm -rf /media/p8
	rm -rf /media/p9
	echo "Done"
}
############
### MAIN ###
############
command=$(basename $0)

declare -a commands=("emmc_tfa" "emmc_tfa_metadata" "emmc_fip" "emmc_bootfs_fs" "emmc_rootfs" "emmc_full_image")

# Check the command
findC=false
for i in "${commands[@]}"
do
	if [ "$i.sh" == "$command" ];
	then

		findC=true
		command=$i

		break
	fi
done

if [ "$findC" == false ];
then
	echo "ERROR: Command $command not found"
	exit
fi

if [ "$1" == "-h" ];
then
	usage $command
fi

if [ ! -b "$1" ]
then
	usage $command
else
	DEVICE=$1
fi

# Check env & sintax
pathfile="."
file_gpt="."
seek=""

if [ "$2" == "" ]; # No path specified
then
	usage $command
else
	pathfile=$2
fi

if [ "$3" == "-p" ]; # No path specified
then
  if [ "$4" == "" ];
	then
		usage $command
  else
	   file_gpt=$4
     check_file ${file_gpt}
  fi
fi

# Check files

if [ "${pathfile: -1}" != "/" ];
then
	pathfile+="/"
fi

if grep -q "tfa" <<< "$command" ;
then
	check_file "${pathfile}tf-a.stm32"
fi

if grep -q "metadata" <<< "$command" ;
then
	check_file "${pathfile}metadata.bin"
fi

if grep -q "fip" <<< "$command" ;
then
  check_file "${pathfile}fip.bin"
fi

if grep -q "rootfs" <<< "$command" ;
then
	check_file "${pathfile}rootfs.tar.xz"
fi

if grep -q "bootfs_fs" <<< "$command" ;
then
  check_file "${pathfile}bootfs.tar.xz"
  check_file "${pathfile}vendorfs.tar.xz"
  check_file "${pathfile}rootfs.tar.xz"
  check_file "${pathfile}userfs.tar.xz"
fi

if grep -q "full_image" <<< "$command" ;
then
  check_file "${pathfile}tf-a.stm32"
	check_file "${pathfile}metadata.bin"
  check_file "${pathfile}fip.bin"
  check_file "${pathfile}bootfs.tar.xz"
  check_file "${pathfile}vendorfs.tar.xz"
  check_file "${pathfile}rootfs.tar.xz"
  check_file "${pathfile}userfs.tar.xz"
fi



# DO COMMAND

if [ "$3" == "-p" ] ; # Partitioning emmc
then
	create_emmc $DEVICE ${file_gpt}
fi

if grep -q "tfa" <<< "$command" ; # Write tf-a
then
	write_tf-a $DEVICE "${pathfile}tf-a.stm32"
fi

if grep -q "metadata" <<< "$command" ; # Write trusted-firmware metadata
then
	write_trusted_firmware_metadata $DEVICE "${pathfile}metadata.bin"
fi

if grep -q "fip" <<< "$command" ; # Write fip
then
	write_fip $DEVICE "${pathfile}fip.bin"
fi

if grep -q "rootfs" <<< "$command" ; # Write rootfs
then
	write_rootfs $DEVICE "${pathfile}rootfs.tar.xz"
fi

if grep -q "bootfs_fs" <<< "$command" ; # Write bootfs and fs
then
	write_bootfs_fs $DEVICE ${pathfile}
fi

if grep -q "full_image" <<< "$command" ; # Write full image
then
	write_full_image $DEVICE ${pathfile}
fi

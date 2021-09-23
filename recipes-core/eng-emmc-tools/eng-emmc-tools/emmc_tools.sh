#!/bin/bash
# EMMC programmer

ver="ver. 1.0, 2020-09-15"

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

	if [ "$1" == "emmc_fip" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
	fi

	if [ "$1" == "emmc_bootfs_fs" ];
	then
		echo "Usage: ${1}.sh [-h] <emmc_device> $path"
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
		 1              34            4129   2.0 MiB     8301  fip
		 2            4130          135201   64.0 MiB    8300  bootfs
		 3          135202          167969   16.0 MiB    8300  vendorfs
		 4          167970         6459425   3.0 GiB     8300  rootfs
		 5         6459426         7405534   462.0 MiB   8300  userfs
	  "
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

function write_fip
{

  dd if=/dev/zero of=$1"p1" conv=fdatasync
  dd if=$2 of=$1"p1" bs=1M conv=fdatasync

  sync

	echo "Done"
}

function write_rootfs
{


  mkfs.ext4 -F $1"p4"
	error $?

  mkdir -p /media/p4

  mount $1"p4" /media/p4

  echo "Fill rootfs   ..."
  tar -xvf $2 -C /media/p4/ 2>&1 >/dev/null

  sync
	umount /media/p4
	rm -rf /media/p4
	echo "Done"
}

function write_bootfs_fs
{

  mkfs.ext4 -O ^metadata_csum,^dir_index -F $1"p2"
	error $?
  mkfs.ext4 -F $1"p3"
	error $?
  mkfs.ext4 -F $1"p4"
	error $?
  mkfs.ext4 -F $1"p5"
	error $?


  mkdir -p /media/p2
  mkdir -p /media/p3
  mkdir -p /media/p4
  mkdir -p /media/p5
  mount $1"p2" /media/p2
	error $?
  mount $1"p3" /media/p3
	error $?
  mount $1"p4" /media/p4
	error $?
  mount $1"p5" /media/p5
	error $?

  echo "Fill bootfs   ..."
  tar -xvf $2"bootfs.tar.xz" -C /media/p2/ 2>&1 >/dev/null
  echo "Fill vendorfs ..."
  tar -xvf $2"vendorfs.tar.xz" -C /media/p3/ 2>&1 >/dev/null
  echo "Fill rootfs   ..."
  tar -xvf $2"rootfs.tar.xz" -C /media/p4/ 2>&1 >/dev/null
  echo "Fill userfs   ..."
  tar -xvf $2"userfs.tar.xz" -C /media/p5 2>&1 >/dev/null

  sync
	umount /media/p2
	umount /media/p3
	umount /media/p4
	umount /media/p5
	rm -rf /media/p2
	rm -rf /media/p3
	rm -rf /media/p4
	rm -rf /media/p5
	echo "Done"
}

function write_full_image
{

  write_tf-a $1 $2"tf-a.stm32"
  write_fip $1 $2"fip.bin"

  mkfs.ext4 -O ^metadata_csum,^dir_index -F $1"p2"
	error $?
  mkfs.ext4 -F $1"p3"
	error $?
  mkfs.ext4 -F $1"p4"
	error $?
  mkfs.ext4 -F $1"p5"
	error $?

  mkdir -p /media/p2
  mkdir -p /media/p3
  mkdir -p /media/p4
  mkdir -p /media/p5
  mount $1"p2" /media/p2
	error $?
  mount $1"p3" /media/p3
	error $?
  mount $1"p4" /media/p4
	error $?
  mount $1"p5" /media/p5
	error $?

  echo "Fill bootfs   ..."
  tar -xvf $2"bootfs.tar.xz" -C /media/p2/ 2>&1 >/dev/null
  echo "Fill vendorfs ..."
  tar -xvf $2"vendorfs.tar.xz" -C /media/p3/ 2>&1 >/dev/null
  echo "Fill rootfs   ..."
  tar -xvf $2"rootfs.tar.xz" -C /media/p4/ 2>&1 >/dev/null
  echo "Fill userfs   ..."
  tar -xvf $2"userfs.tar.xz" -C /media/p5 2>&1 >/dev/null

  sync
	umount /media/p2
	umount /media/p3
	umount /media/p4
	umount /media/p5
	rm -rf /media/p2
	rm -rf /media/p3
	rm -rf /media/p4
	rm -rf /media/p5
	echo "Done"
}
############
### MAIN ###
############
command=$(basename $0)

declare -a commands=("emmc_tfa" "emmc_fip" "emmc_bootfs_fs" "emmc_rootfs" "emmc_full_image")

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

# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Cartel Kernel by eun0115
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=1
device.name1=wisdom
device.name2=wisdomwifi
device.name3=gta3xl
device.name4=gta3xlwifi
device.name5=
supported.versions=10-11
'; } # end properties

# shell variables
block=auto;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
dump_boot;

# mount system and vendor
mount /system_root;
mount -o rw,remount /vendor;

# Find device/rom and copy kernel
device_name="$(grep ro.product.vendor.device /vendor/build.prop | cut -d'=' -f2)";
if grep -q gta3xlwifi /vendor/build.prop; then
    cp -f "$home/Image_${device_name}" "$home/Image";
elif grep -q gta3xl /vendor/build.prop; then
    cp -f "$home/Image_${device_name}" "$home/Image";
elif grep -q wisdomwifi /vendor/build.prop; then
    cp -f "$home/Image_${device_name}" "$home/Image";
else
    cp -f "$home/Image_${device_name}" "$home/Image";
fi

write_boot;

## end install

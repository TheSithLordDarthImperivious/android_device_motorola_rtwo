# Motorola Edge 40 Pro/Motorola Edge+ 2023/Moto X40 (Codename: "rtwo") TWRP Port (Unofficial)

This is an unofficial TWRP device tree for the Motorola Edge 40 Pro/Motorola Edge+ 2023/Moto X40.

# Warning

```
/*
* Your warranty is now void.
*
* I am not responsible for bricked devices, total data loss,
* thermonuclear war, or you getting fired because your phone got stuck in a bootloop. Please
* do some research if you have any concerns about this unofficial TWRP port
* before flashing it! YOU are choosing to make these modifications, and if
* you point the finger at me for messing up your device, I will laugh at you.
* I am also sacrificing my device just to make this TWRP port,
* so you will be putting your device at risk by using certain features of this TWRP port.
*/
```

# Note

This family of phones uses boot.img's kernel to boot the recovery (kind of like recovery-on-boot, except recovery is on a second ramdisk). As a result, an empty kernel image is provided as a workaround (the TWRP build system needs a kernel image). A special command is included in `bootimg.mk`. Without it, the device will throw you

`No valid operating system found` 

when attempting to boot into recovery mode (Android itself will still boot fine, only recovery is affected until you flash a proper image).

Attempting to boot using `fastboot boot` will not work; it must be flashed to recovery. Since it has no kernel, `fastboot boot recovery.img` will result in the same `No valid operating system found` error.

# Working Features
- It can boot
- Touchscreen
- File Manager (can browse files and mounted partitions such as `/system`)
- Can read (and possibly write) internal storage (you have to mount from terminal currently). Exception is `/data`, which is encrypted.
- CPU Temperature
- Brightness (there is a default brightness that works in most environments set, but it of course can be adjusted through the slider)
- USB with adb (MTP appears in lsusb, so this should work as well)
- Super partition mapping (dm devices appear in /dev/block, and all match up with Android's numbering).

# Non-working features
- USB host mode (eg. Read USB drives)
- Battery percentage (LineageOS recovery has the same issue, so it is universal across all recoveries)
- fastbootd (please do not try to boot into fastbootd, it may throw your device into a state where it can only boot into Android when "fastboot boot boot.img" is used, and it can only be exited when stock/LineageOS recovery.img is flashed).
- `/data` partition with FBE (FBE just does not work)

# Untested
- Flashing ZIPs/adb sideload (will test with LineageOS upgrade from 21 to 22 soon)
- Factory reset (I do not want to wipe my phone just to test TWRP)
- Backup/Restore super partition (backup of `/data` is guaranteed not going to work because again, encryption)
- Anything else that you may use TWRP for normally

# Instructions to Build

Same as all other TWRP (Android 12.1) device trees (when you git clone, the device tree is supposed to be located in device/motorola/rtwo, and no branch is required).

# Credits

- ThEMarD for the LineageOS port (allowed me to find out values from the rtwo device trees, and the command for mkbootimg which can produce working images for rtwo, found from the LineageOS build logs). LineageOS device trees can be found here: https://github.com/moto-sm8550/android_device_motorola_rtwo and here: https://github.com/moto-sm8550/android_device_motorola_sm8550-common
- The person who created the Samsung Galaxy S23 port for TWRP (used as a base, as both phones have the same SoC/Processor): https://github.com/TeamWin/android_device_samsung_dm1q

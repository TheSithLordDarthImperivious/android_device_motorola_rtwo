# Motorola Edge 40 Pro TWRP (rtwo)

This is the TWRP device tree for the Motorola Edge 40 Pro.

# Note

Motorola rtwo uses the recovery boot.img as the kernel.

# Instructions

Same as all. Except, ignore the recovery.img in the out directory and run this command from within the boot directory:

```bash
out/host/linux-x86/bin/mkbootimg --ramdisk out/target/product/rtwo/ramdisk-recovery.img --base 0x00000000 --pagesize 4096 --dtb ~/LineageSource/out/target/product/rtwo/dtb.img --os_version 14 --os_patch_level 2024-12-01 --header_version 4 --output recovery.img
```

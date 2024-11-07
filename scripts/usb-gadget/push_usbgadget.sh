#!/bin/bash

# push S49usbgadget to the device

echo "pushing S49usbgadget, busybox and dhcp script to device"
adb shell mount -o remount,rw /
adb shell "mountpoint /etc/init.d/S49usbgadget 2>/dev/null || umount /etc/init.d/S49usbgadget"
adb shell mkdir /etc/udhcpc
adb push rootfs/* /
adb shell chmod +x /tmp/busybox
adb shell chmod +x /bin/coredhcp
adb shell chmod +x /etc/init.d/S49usbgadget
adb shell chmod +x /etc/udhcpc/default.script
adb shell chmod +x /etc/udev/rules.d/50-usb.rules
adb shell chmod +x /sbin/restart_usb
adb shell mv /tmp/busybox /bin
adb shell busybox --install
adb shell sync
sleep 5s
adb shell mount -o remount,ro /  # OK if this step fails
adb shell reboot

echo "device will reboot in about 5 seconds"

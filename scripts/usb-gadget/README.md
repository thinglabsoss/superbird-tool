# ADB & RNDIS over USB
These scripts and files will enable ADB and RNDIS (USB Networking) on the Car Thing.
### This does not work on MacOS
MacOS lacks the RNDIS drivers needed to commmunicate with the Car Thing. If you find a driver that works, please open an issue or tell us in the Discord!

## Modes
There are 3 modes you can put the RNDIS gadget in:
* `dhserver` - Default
  * This will set the IP of your Car Thing to `192.168.7.2` and give your PC an IP of `192.168.7.1`
  * Your Car Thing will not have internet access in this mode.

* `dhclient`
  * This will run a DHCP client on your Car Thing so it can get an IP address from your PC.
  * With this mode, your Car Thing will have full internet access through your computer.
  * On Windows, you can set up "Internet Connection Sharing (ICS)" to share your connection - https://www.tomshardware.com/how-to/share-internet-connection-windows-ethernet-wi-fi
  * On Linux, if you're using NetworkManager you can set up a shared connection - https://fedoramagazine.org/internet-connection-sharing-networkmanager/
 
* `static`
  * This will simply set the IP address of your Car Thing to `192.168.7.2` and the gateway to `192.168.7.1`.
  * It's up to you to figure out what you want to do with this mode
  
You can switch modes by editing `S49usbgadget`, changing the `ipMode` variable to your mode of choice and running `./push_usbgadget.sh` \
If you've already ran the command, it's safe to run it again after editing the variable.

Busybox binary acquired from https://github.com/shutingrz/busybox-static-binaries-fat \
DHCP server used is CoreDHCP https://github.com/coredhcp/coredhcp
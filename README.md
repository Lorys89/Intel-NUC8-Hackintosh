[![](https://img.shields.io/badge/EFI-Release-informational?style=flat&logo=apple&logoColor=white&color=9debeb)](https://github.com/Lorys89/Intel-NUC8-Hackintosh/releases)

# Intel NUC8 BEH & BEK Hackintosh
## With Thunderbolt Hot-Plug Works without flashing

EFI for Intel NUC8 i3/i5/i7 BEH/BEK with OpenCore bootloader

![descrizione](./Screenshot/pc.png)

### MY NUC8i3BEH Spec:

| Component        | Brank                                  |
| ---------------- | ---------------------------------------|
| CPU              | Intel® Core™ i3-8109U (2C-4T)          |
| iGPU             | Intel® Iris® Plus 655                  |
| Lan              | Intel I219-V                           |
| Audio            | Realtek ALC235                         |
| Ram              | 16 GB DDR4 2400 Mhz                    |
| Wifi + Bluetooth | Intel® Wireless-AC 9560 + Bluetooth 5.0|
| Nvme             | Samsung 970 EVO PLUS 500GB             |
| SSD              | SiliconPower A55 512 GB                |
| Card Reader.     | microSDXC Card Reader                  |
| SmBios           | MacMini8,1                             |
| BootLoader       | OpenCore 0.9.4 (Release)               |
| macOS Version    | Ventura Beta 13.6 (22G115)             |


![info](./Screenshot/INFO.png)

## Peripherals

![infohack](./Screenshot/hackintoolPERIPH.png)
![infopci](./Screenshot/hackintoolPCI.png)

### What works and What doesn't or WIP:

- [x] Intel Intel® Iris® Plus 655 iGPU HDMI Output
- [x] ALC235 Internal Speakers
- [x] ALC235 HDMI Audio Output
- [x] All USB Ports 
- [x] SpeedStep / Sleep / Wake
- [x] Intel I219-V
- [x] Thunderbolt 3 port (hotplug without fw flash)
- [x] AC 9560 Wireless + Bluetooth
- [x] microSDXC Card Reader
- [x] NVRAM

### BIOS Settings:
To start, choose "Load Defaults" (choose from the menu or press F9 in the BIOS setup).

Then change:
- Boot->Boot Configuration, disable "Network Boot"
- Power->Secondary Power Settings, "Wake on LAN from S4/S5", set to "Stay Off"

These settings are important but are already set as needed by "Load Defaults"
- Devices->Video, "IGD Minimum Memory" set to 64mb or 128mb
- Devices->Video, "IGD Aperture Size" set to 256mb
- Boot->Secure Boot, "Secure Boot" is disabled
- Security->Security Features, "Execute Disable Bit" is enabled.

### Special Config:

- Usb port mapping performed


See [ioreg](./macminik.ioreg) for more clarification

## Credits

- [Apple](https://apple.com) for macOS.
- [Intel](https://www.intel.it/content/www/it/it/products/details/nuc.html) for this mini pc.
- [Acidanthera](https://github.com/acidanthera) for OpenCore and all the lovely hackintosh work.

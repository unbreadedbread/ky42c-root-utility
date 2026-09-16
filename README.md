# ky42c-root-utility

Run `Unblock-File ky42c-utility.ps1` in an Administrator PowerShell to allow this script to work.
Next, run `./ky42c-utility.ps1 -setup -unlock`. Power off your phone, and plug it in. Be sure you have the drivers.
Then, run `./ky42c-utility.ps1 -backup`. Put the boot.img file in the backups directory through magisk on the phone,
Use `adb reboot bootloader` then `fastboot flash boot PATH/TO/BOOT.IMG`.
Finally, reboot the phone with `fastboot reboot`.

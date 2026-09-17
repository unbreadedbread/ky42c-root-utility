# ky42c-root-utility

This is a wrapper utility for Shomy's unlock tool, Momo's patch, and Penubra. It sets up an all-in-one environment for scripts to run, and abstracts some of the details that most people rooting their phone won't care about.

> [!CAUTION]
> This tool is untested (I don't have the phone this targets). There's a very high chance it will have some bug. If you run into problems, let me know. Use this tool at your own risk.

## Usage

If you are using Linux, you **may** be able to run this script by downloading PowerShell (it's cross-platform)

You must run `Unblock-File ky42c-utility.ps1` in an Administrator PowerShell window to allow this script to work.
You could also run `Set-ExecutionPolicy Unrestricted` but this is considered less secure.

> [!NOTE]
> This script downloads binary files from GitHub automatically. If you don't want this to happen, comment out all lines starting with `Invoke-WebRequest`. 

* Run `./ky42c-utility.ps1 -setup -unlock`. Power off your phone, and plug it in. Be sure you have the MTK USB drivers. This will unlock the bootloader.
* Then, run `./ky42c-utility.ps1 -backup`. Put the boot.img file in the `backups` directory it creates through Magisk on the phone. Copy it back to your computer. You may have to turn off your phone during this step (I'm not sure)
* To flash this new image, `adb reboot bootloader` then `fastboot flash boot PATH/TO/BOOT.IMG`. (the phone is now rooted at this stage)
* Finally, reboot the phone with `fastboot reboot`.

Congratulations!! Your phone should now be rooted.

## Legal

This script is licensed under the MPL-2.0, see LICENSE. Shomy's unlock utility (and Momo's patch) and Penumbra are licensed under the GNU AGPL; MTK Client is licensed under GPL-3.0.

# miniosfix
A fix you can try with minios if modmium bricks ur chromebook to the point where you can only enter recovery mode.

First you need to get a [minios shim](https://discord.com/invite/crosbreaker-1375357349425971231). It should be in the minios-usb-images section. Flash it with the Device Recovery Utility.
Then you need to:
- Enter recovery mode (Esc+refresh+power)
- Plug in the shim
- Connect to internet

If you see internet recovery, <ins>this is intended</ins>! Do not get out of it.

Press Ctrl+Alt+F3. If you only see a black screen, try F4. You will get a bash shell.
In the shell, run:

curl -LOk https://raw.githubusercontent.com/CrOSmium/modmium/refs/heads/nightly/mod-files/usr/bin/firmware-revert.sh


mv firmware-revert.sh /tmp


mount /dev/mmcblk0p3 /localroot


mount --bind /dev /localroot/dev -r (keep doing it for all mount)


mount --bind /proc /localroot/proc


mount --bind /run /localroot/run


mount --bind /sys /localroot/sys


mount --bind /tmp /localroot/tmp


chroot /localroot

(you will see your shell change)

curl -LOsk raw.githubusercontent.com/whypasswords2/miniosfix/main/miniosfix.sh && bash miniosfix.sh

#Done! Bye! (this is my first github repo, please don't make fun of me)

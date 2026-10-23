echo "Creating workspace..."

mkdir /tmp/firmware

echo "Extracting old BIOS..."

chromeos-firmwareupdate -m output --output_dir /tmp/firmware

echo "Setting up workspace..."

cd /tmp/firmware

echo "Reading VPD from old BIOS..."

cbfstool oldimage.bin read -r RO_VPD -f rovpd.bin

cbfstool oldimage.bin read -r RW_VPD -f rwvpd.bin

cbfstool image.bin write -r RO_VPD -f rovpd.bin

cbfstool image.bin write -r RW_VPD -f rwvpd.bin

echo "Extracting hardware ID..."

futility gbb oldbios.bin -g --hwid | sed "s/hardware_id: //" > hwid.txt

echo "Writing hardware ID to new BIOS..."

futility gbb image.bin -s --hwid="$(cat hwid.txt)"

echo "Flashing new BIOS..."

flashrom -w image.bin

echo "Setting GBB flags..."

futility gbb -s --flash --flags=0xa0b1

echo "Flashing complete. Will reboot in 5 seconds..."
sleep 5
reboot

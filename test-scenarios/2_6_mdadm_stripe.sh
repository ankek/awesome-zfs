# run as root
############
echo "###################################"
echo "Striped MDADM Pool"
echo "Number of Drives - 2"
echo ""
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=6 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1
echo "----------------------------------"

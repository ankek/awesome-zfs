# run as root
############
echo "###################################"
echo "MDADM RAID5 Pool"
echo "Number of Drives - 3"
echo ""
mdadm --create --verbose /dev/md5 --level=5 --raid-devices=6 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1
echo "----------------------------------"

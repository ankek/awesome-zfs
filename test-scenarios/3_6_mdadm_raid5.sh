# Please run as root
############
echo "###################################"
echo "MDADM RAID5 Pool"
echo "Number of Drives - 3"
echo ""
#mdadm --create --verbose /dev/md5 --level=5 --raid-devices=3 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1
mdadm --create --verbose /dev/md5 --level=5 --raid-devices=3 /scratch/3g-1.img /scratch/3g-2.img /scratch/3g-3.img
echo "----------------------------------"

# Please run as root
############
echo "###################################"
echo "ZFS Striped + Mirrored (similar to RAID 10) Pool"
echo "Number of Drives - 4"
echo "Number of Mirrors - 2"
echo ""
zpool create test-pool mirror /scratch/3g-1.img /scratch/3g-2.img mirror /scratch/3g-3.img /scratch/3g-4.img
zfs list
zpool status test-pool
zpool list test-pool
zpool iostat test-pool
zpool destroy test-pool
echo "----------------------------------"

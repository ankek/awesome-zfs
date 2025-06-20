# Please run as root
############
echo "###################################"
echo "ZFS Mirrored (similar to RAID 1) Pool"
echo "Number of Drives - 2"
echo ""
zpool create test-pool mirror /scratch/3g-1.img /scratch/3g-2.img
zfs list
zpool status test-pool
zpool list test-pool
zpool iostat test-pool
zpool destroy test-pool
echo "----------------------------------"

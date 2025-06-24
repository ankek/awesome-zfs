# Please run as root
############
echo "###################################"
echo "ZFS Single Drive Pool"
echo "Number of Drives - 1"
echo ""
zpool create test-pool /scratch/3g-1.img
zfs list
zpool status test-pool
zpool list test-pool
zpool iostat test-pool
zpool destroy test-pool
echo "----------------------------------"

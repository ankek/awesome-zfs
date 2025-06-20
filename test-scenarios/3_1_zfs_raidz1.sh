# Please run as root
############
echo "###################################"
echo "RAID-Z Pool (RAID-Z1)"
echo "Number of Drives - 3"
echo ""
zpool create test-pool raidz /scratch/3g-1.img /scratch/3g-2.img /scratch/3g-3.img
zfs list
zpool status test-pool
zpool list test-pool
zpool iostat test-pool
zpool destroy test-pool
echo "----------------------------------"

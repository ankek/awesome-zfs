# Please run as root
############
echo "###################################"
echo "RAID-Z3 Pool"
echo "Number of Drives - 5"
echo ""
zpool create test-pool raidz /scratch/3g-1.img /scratch/3g-2.img /scratch/3g-3.img /scratch/3g-4.img /scratch/3g-5.img
zfs list
zpool status test-pool
zpool list test-pool
zpool iostat test-pool
zpool destroy test-pool
echo "----------------------------------"

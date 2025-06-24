# Please run as root
############
for i in {1..2}; do truncate -s 3G /scratch/3g-$i.img; done
for i in {1..2}; do truncate -s 7G /scratch/7g-$i.img; done
for i in {1..2}; do truncate -s 12G /scratch/12g-$i.img; done
echo "###################################"
echo "ZFS Mirrored (RAID 1) Pool"
echo "Number of Drives - 2"
echo ""
zpool create test-pool mirror /scratch/3g-1.img /scratch/3g-2.img
zpool list test-pool
zpool iostat test-pool
zpool get autoexpand test-pool
zpool set autoexpand=on test-pool
zpool get autoexpand test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"
sleep 5s
# 1
echo "###################################"
echo "Outage of DISK 1"
dd if=/dev/zero of=/scratch/3g-1.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/3g-1.img /scratch/7g-1.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"

# 2
echo "###################################"
echo "Outage of DISK 2"
dd if=/dev/zero of=/scratch/3g-2.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/3g-2.img /scratch/7g-2.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"

echo "###################################"
echo "Destroying POOL"
sleep 5s
zpool destroy test-pool
echo "----------------------------------"
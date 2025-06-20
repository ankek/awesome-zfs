# Please run as root
############
for i in {1..5}; do truncate -s 3G /scratch/3g-$i.img; done
for i in {1..5}; do truncate -s 7G /scratch/7g-$i.img; done
for i in {1..5}; do truncate -s 12G /scratch/12g-$i.img; done
echo "###################################"
echo "Creating RAIDZ2 Pool"
zpool create test-pool raidz2 /scratch/3g-1.img /scratch/3g-2.img /scratch/3g-3.img /scratch/3g-4.img /scratch/3g-5.img
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

#2
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

#3
echo "###################################"
echo "Outage of DISK 3"
dd if=/dev/zero of=/scratch/3g-3.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/3g-3.img /scratch/7g-3.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"

#4
echo "###################################"
echo "Outage of DISK 4"
dd if=/dev/zero of=/scratch/3g-4.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/3g-4.img /scratch/7g-4.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
zpool list test-pool
zpool iostat test-pool
echo "----------------------------------"

#5
echo "###################################"
echo "Outage of DISK 5"
dd if=/dev/zero of=/scratch/3g-5.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/3g-5.img /scratch/7g-5.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
zpool list test-pool
zpool iostat test-pool
echo "----------------------------------"

############
# 1
echo "###################################"
echo "Outage of DISK 1 - 7GB"
dd if=/dev/zero of=/scratch/7g-1.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/7g-1.img /scratch/12g-1.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"
#2
echo "###################################"
echo "Outage of DISK 2 - 7GB"
dd if=/dev/zero of=/scratch/7g-2.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/7g-2.img /scratch/12g-2.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"
#3
echo "###################################"
echo "Outage of DISK 3 - 7GB"
dd if=/dev/zero of=/scratch/7g-3.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/7g-3.img /scratch/12g-3.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
echo "----------------------------------"
#4
echo "###################################"
echo "Outage of DISK 4 - 7GB"
dd if=/dev/zero of=/scratch/7g-4.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/7g-4.img /scratch/12g-4.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
zpool list test-pool
zpool iostat test-pool
echo "----------------------------------"
#5
echo "###################################"
echo "Outage of DISK 5 - 7GB"
dd if=/dev/zero of=/scratch/7g-5.img bs=4M count=1 2>/dev/null
zpool scrub test-pool
zpool status test-pool
zpool replace test-pool /scratch/7g-5.img /scratch/12g-5.img
sleep 5s
zpool status test-pool
echo ""
df -h /test-pool/
echo ""
zfs list
zpool list test-pool
zpool iostat test-pool
echo "----------------------------------"

echo "###################################"
echo "Destroying POOL"
sleep 5s
zpool destroy test-pool
echo "----------------------------------"
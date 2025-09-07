#!/bin/bash
# This script
# 1. Create a single-drive ZFS pool using a 3 GB test file as a virtual disk.
# 2. Inspect the pool and its datasets with zfs list.
# 3. Check pool status to ensure it is online and error-free.
# 4. Review pool statistics with zpool list.
# 5. Monitor I/O activity with zpool iostat.
# 6. Clean up by destroying the test pool after inspection.

########################
## Please run as root ##
########################

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

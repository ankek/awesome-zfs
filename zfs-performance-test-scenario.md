# ZFS Performance Test scenario
## Intro
We would like to compare performance with same set of [hardware components](https://www.amazon.de/hz/wishlist/ls/ZF2AIF60C7X3?ref_=wl_share) and all the money from "Buy Me a Coffee" will be spent on hardware:
  - for RAIDZ (RAIDZ1 vs. RAIDZ2 vs. RAIDZ3)
  - for dRAID (dRAID1 vs. dRAID2 vs. dRAID3)
  - for other RAIDs, supported by OpenZFS like RAID0 vs. RAID1 vs. RAID10
  - with other FS (OpenZFS vs. Btrfs vs. GlusterFS vs. Ceph vs. HDFS vs. Lustre vs. MinIO)  

## Contents
- [ZFS Performance Test scenario](#zfs-performance-test-scenario)
  - [Intro](#intro)
  - [Contents](#contents)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)

## Prerequisites
Test rig with:
* HDD/SDD with operationg system
* HDD/SDD with file storage (used in Step3)
* HBA (Host Bus Adapter) with attached HDDs (used in Step1)
## Steps
1. Create ZFS pool.
2. Run storage benchmarks to score ZFS pool performance.
3. Run "copy" tests.
   1. Copy files from local "file storage" (standalone HDD/SDD with Ext4/XFS filesystem) to ZFS pool.
   2. Move files from local "file storage" (standalone HDD/SDD with Ext4/XFS filesystem) to ZFS pool.
<!-- ## Test case #1 -->

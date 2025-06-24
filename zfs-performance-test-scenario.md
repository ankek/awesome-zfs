# ZFS Performance Test scenario
## Intro
We would like to compare performance with same set of [hardware components](https://www.amazon.de/hz/wishlist/ls/ZF2AIF60C7X3?ref_=wl_share) and all the money from "Buy Me a Coffee" will be spent on hardware.
Measure performance:
  - for RAIDZ (RAIDZ1 vs. RAIDZ2 vs. RAIDZ3)
  - for dRAID (dRAID1 vs. dRAID2 vs. dRAID3)
  - for other RAIDs, supported by OpenZFS like RAID0 vs. RAID1 vs. RAID10
  - with other FS (OpenZFS vs. Btrfs vs. GlusterFS vs. Ceph vs. HDFS vs. Lustre vs. MinIO)

## Why?
The idea of this ZFS test rig to make measures with simple set of hardware components (non-server components) and show the HomeLab usage with ZFS as main storage filesystem.

## Contents
- [ZFS Performance Test scenario](#zfs-performance-test-scenario)
  - [Intro](#intro)
  - [Contents](#contents)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)

## Prerequisites
Test rig with:
* 1 x 128-250Gb HDD/SDD with operating system (options: Debian, Ubuntu)
* 1 x Tb HDD/SDD with file storage (used in Step 3)
* HBA (Host Bus Adapter) with 6 SATA ports (PCIe X4 SATA Expansion Card with 6 SATA, Compatible with Windows, Linux)
* 6 x 6-8Tb HDDs (used in Step 1)
* HBA with 4 Ports M.2 NVMe (PCIe 4.0 X16 Adapter without PCIe Bifurcation Function)
* 4 x 2-3Tb SSD NVME disks (used in Step 1)

  
## Steps
1. Create ZFS pool.
2. Run storage benchmarks to score ZFS pool performance.
3. Run "copy" tests.
   1. Copy files (set of files #1) from local "file storage" (standalone HDD/SDD with Ext4/XFS filesystem) to ZFS pool . 
   2. Move files (set of files #2) from local "file storage" (standalone HDD/SDD with Ext4/XFS filesystem) to ZFS pool.
4. Simulate catastrophic disk failure (i.e. one of the HDDs in the zpool stops functioning)
5. Run steps 2-4 to check performance in degraded state.
6. Rebuild the Zpool.
7. Run steps 2-4 to check performance in restored state.
8. Save results in [Awesome OpenZFS](https://github.com/ankek/awesome-zfs)
<!-- ## Test case #1 -->

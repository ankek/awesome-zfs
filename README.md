# Awesome OpenZFS [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)


> OpenZFS is an open-source implementation of the ZFS file system and volume manager initially developed by Sun Microsystems for the Solaris operating system, and is now maintained by the OpenZFS Project. Similar to the original ZFS, the implementation supports features like data compression, data deduplication, copy-on-write clones, snapshots, RAID-Z, and virtual devices that can create filesystems that span multiple disks. 
> One of the main capabilities of OpenZFS is self-healing. The file system can detect and correct errors while in use, without the need for a dedicated file system checker. This feature makes it suitable for mission-critical applications that require high availability. 
## About
![Alt text](https://openzfs.github.io/openzfs-docs/_static/logo_main.png)
> A curated list of resources on [OpenZFS](https://openzfs.github.io/openzfs-docs/).

## Support
> [!IMPORTANT]  
> Your [contributions](https://github.com/ankek/awesome-zfs/blob/main/contributing.md) are welcome!
- This project has no sponsors but we accepting donations to purchase hardware for OpenZFS test rig. We would like to compare performance with same set of hardware components:
  - for RAIDZ (RAIDZ1 vs. RAIDZ2 vs. RAIDZ3)
  - for dRAID (dRAID1 vs. dRAID2 vs. dRAID3)
  - for other RAIDs, supported by OpenZFS like RAID0 vs. RAID1 vs. RAID10
  - with other FS (OpenZFS vs. Btrfs vs. GlusterFS vs. Ceph vs. HDFS vs. Lustre vs. MinIO)

## Contents

- [Awesome OpenZFS ](#awesome-openzfs-)
  - [About](#about)
  - [Support](#support)
  - [Contents](#contents)
  - [Legend](#legend)
  - [Official Resources](#official-resources)
    - [RAIDZ official doc](#raidz-official-doc)
    - [dRAID official doc](#draid-official-doc)
    - [RAID with ZFS (unofficial)](#raid-with-zfs-unofficial)
  - [Tutorials](#tutorials)
    - [Beginner Guides](#beginner-guides)
  - [ZFS tools](#zfs-tools)
  - [ZFS Cheat Sheets](#zfs-cheat-sheets)
  - [ZFS Testing](#zfs-testing)
  - [Links](#links)
  - [Videos](#videos)
  - [License](#license)

## Legend
- Abandoned :skull:
- Monetized :moneybag:

## Official Resources
- [Official website](https://openzfs.org/)
- [OpenZFS GitHub](https://github.com/openzfs/zfs)
- [Getting Started](https://openzfs.github.io/openzfs-docs/Getting%20Started/index.html)
### RAIDZ official doc
RAIDZ is a variation on RAID-5 that allows for better distribution of parity and eliminates the RAID-5 “write hole”. Data and parity is striped across all disks within a raidz group. RAIDZ is effective for large block sizes and sequential workloads.
- [RAIDZ documentation](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/RAIDZ.html)
### dRAID official doc
dRAID is a variant of [RAIDZ](#raidz) that provides integrated distributed hot spares which allows for faster resilvering while retaining the benefits of raidz.
- [dRAID documentation](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/dRAID%20Howto.html#introduction)
### RAID with ZFS (unofficial)
Open ZFS focused on [RAIDZ](#raidz-official-doc) and [dRAID](#draid-official-doc).
Meanwhile it also support other RAID types like Stripe and Mirror.
- [Simple ZFS Pools](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md#creating-simple-zfs-pools)

## Tutorials
### Beginner Guides
- [ZFS 101](https://arstechnica.com/information-technology/2020/05/zfs-101-understanding-zfs-storage-and-performance/)
## ZFS tools
- [ZFS pool monitoring and notification daemon](https://github.com/rouben/zfswatcher)
- [ZFS raidz calculator1](https://www.raidz-calculator.com/)
- [ZFS raidz calculator2](https://zfs-calculator.com/)
- [ZFS backup tools](https://github.com/Rudd-O/zfs-tools)
- [Zyggy - Simple GUI for ZFS administration](https://github.com/manoeldesouza/zyggy)
- :moneybag:[Poolsman - Web UI for OpenZFS](https://www.poolsman.com/)
- :skull:[ZFS Commander](https://github.com/manoeldesouza/zc)

## ZFS Cheat Sheets
- [ZFS Cheat Sheet](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md)
- [ZFS Cheat Sheet2](https://www.zfshandbook.com/docs/references/cheatsheet/)
- [ZFS Cheat Sheet3](https://blog.mikesulsenti.com/zfs-cheat-sheet-and-guide/)

## ZFS Testing
- [ZFS performance results](https://icesquare.com/wordpress/zfs-performance-mirror-vs-raidz-vs-raidz2-vs-raidz3-vs-striped/)

<!-- ## ZFS vs. other Filesystems -->
<!-- Btrfs
GlusterFS
Ceph
HDFS
Lustre
MinIO -->

## Links
- [ZFS CLI reference](https://www.zfshandbook.com/docs/references/command-reference/)
- [ZFS performance considerations](https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#performance-considerations)
- [Accessing ZFS Disks on Windows](https://hetmanrecovery.com/recovery_news/how-to-open-a-zfs-file-system-disk-in-windows.htm)
- [ZFS walkthrough](https://arstechnica.com/information-technology/2014/02/ars-walkthrough-using-the-zfs-next-gen-filesystem-on-linux/)

<!-- ## Books -->

## Videos
- [Cockpit+ZFS Manager plugin](https://www.youtube.com/watch?v=1HEO7qXa6jo&t=745s)

## License

This code is released under the GNU General Public License v3.0. See [LICENSE](LICENSE).
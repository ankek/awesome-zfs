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
    - [Snapshots, Backups and Replication](#snapshots-backups-and-replication)
    - [ZFS performance tuning and benchmarks](#zfs-performance-tuning-and-benchmarks)
  - [ZFS tools](#zfs-tools)
    - [ZFS Calculators](#zfs-calculators)
    - [ZFS GUI](#zfs-gui)
    - [ZFS Monitoring](#zfs-monitoring)
    - [ZFS Backup tools](#zfs-backup-tools)
  - [ZFS Cheat Sheets](#zfs-cheat-sheets)
  - [ZFS Testing](#zfs-testing)
  - [ZFS Encryption](#zfs-encryption)
  - [ZFS on Windows](#zfs-on-windows)
  - [Other Awesome ZFS](#other-awesome-zfs)
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
- [ZFS Guide for starters and advanced users](https://forum.level1techs.com/t/zfs-guide-for-starters-and-advanced-users-concepts-pool-config-tuning-troubleshooting/196035)
### Snapshots, Backups and Replication
- [Secure External Backup with ZFS Native Encryptionp](https://pipo.blog/articles/20210803-secure-zfs-encrypted-extbackup)
- [Sending and Receiving ZFS Data](https://docs.oracle.com/cd/E18752_01/html/819-5461/gbchx.html)
- [How to use snapshots, clones and replication in ZFS on Linux](https://www.howtoforge.com/tutorial/how-to-use-snapshots-clones-and-replication-in-zfs-on-linux/)
- [ZFS Snapshot Tools](https://klarasystems.com/articles/zfs-orchestration-part-1-zfs-snapshots-tools/)
- [Efficient ZFS Replication with Snapshots](https://klarasystems.com/articles/zfs-orchestration-tools-part-2-replication/)
### ZFS performance tuning and benchmarks
- [Managing and Tracking Storage Performance – OpenZFS Storage Bottlenecks](https://klarasystems.com/articles/managing-tracking-storage-performance-openzfs-bottlenecks/)
- [5 Reasons Why Your ZFS Storage Benchmarks Are Wrong](https://klarasystems.com/articles/5-reasons-why-your-zfs-storage-benchmarks-are-wrong/)

## ZFS tools
### ZFS Calculators

- [ZFS raidz calculator1](https://www.raidz-calculator.com/)
- [ZFS raidz calculator2](https://zfs-calculator.com/)

### ZFS GUI
- [Zyggy - Simple GUI for ZFS administration](https://github.com/manoeldesouza/zyggy)
- :moneybag:[Poolsman - Web UI for OpenZFS](https://www.poolsman.com/)
- :skull:[ZFS Commander](https://github.com/manoeldesouza/zc)
### ZFS Monitoring
- [ZFS pool monitoring and notification daemon](https://github.com/rouben/zfswatcher)
### ZFS Backup tools

- [bzfs](https://github.com/whoschek/bzfs)
- [pyznapv](https://github.com/yboetz/pyznap)
- [sanoid](https://github.com/jimsalterjrs/sanoid)
- [zap](https://github.com/Jehops/zap)
- [zfs_autobackup](https://github.com/psy0rz/zfs_autobackup)
- [zfs-autosnapshot](https://github.com/csdvrx/zfs-autosnapshot)
- [zfs-auto-snapshot](https://github.com/zfsonlinux/zfs-auto-snapshot)
- [zfs-backup via zfs send/recv over ssh](https://github.com/adaugherity/zfs-backup)
- [zfs_mgmt](https://github.com/aranc23/zfs_mgmt)
- [zfsnap](https://www.zfsnap.org/)
- [zfsnap - Rolling ZFS snapshots](https://github.com/zfsnap/zfsnap)
- [zfs-periodic](https://github.com/ross/zfs-periodic)
- [zfs-remote-mirror -Setting up a remote ZFS mirror](https://github.com/hughobrien/zfs-remote-mirror)
- [zfs-replicate](https://github.com/aaronhurt/zfs-replicate)
- [zfs-snapshot-mgmt](http://marcin.studio4plus.com/en/zfs-file-history/howto.html)
- [zfstools](https://github.com/bdrewery/zfstools)
- [zfs-tools - ZFS backup tools](https://github.com/Rudd-O/zfs-tools)
- [znapzend](https://www.znapzend.org/)
- [zrep](http://www.bolthole.com/solaris/zrep/)
- [zrepl - ZFS backup & replication solution](https://zrepl.github.io/)
- [zxfer](https://github.com/allanjude/zxfer)

## ZFS Cheat Sheets
- [ZFS Cheat Sheet](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md)
- [ZFS Cheat Sheet2](https://www.zfshandbook.com/docs/references/cheatsheet/)
- [ZFS Cheat Sheet3](https://blog.mikesulsenti.com/zfs-cheat-sheet-and-guide/)
- [ZFS tuning cheat sheet](https://jrs-s.net/2018/08/17/zfs-tuning-cheat-sheet/)
- [ZFS RAIDZ Expansion Is Awesome but Has a Small Caveat](https://louwrentius.com/zfs-raidz-expansion-is-awesome-but-has-a-small-caveat.html)

## ZFS Testing
- [ZFS performance results](https://icesquare.com/wordpress/zfs-performance-mirror-vs-raidz-vs-raidz2-vs-raidz3-vs-striped/)
- [ZFS performance considerations](https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#performance-considerations)
  
## ZFS Encryption
- [ZFS native encryption kick-off article](https://arstechnica.com/gadgets/2021/06/a-quick-start-guide-to-openzfs-native-encryption/)
- [OpenZFS on OS X encryption support](https://openzfsonosx.org/wiki/Encryption)
- [ Tutorial on how to backup encrypted ZFS data on untrusted storage without the need of unlocking it.](https://mtlynch.io/zfs-encrypted-backups/)
- [How to install LUKS encrypted Server and enable remote unlocking tutorial](https://hamy.io/post/0009/how-to-install-luks-encrypted-ubuntu-18.04.x-server-and-enable-remote-unlocking/)


## ZFS on Windows
- [Open ZFS on Windows](https://github.com/openzfsonwindows/openzfs)
- [Accessing ZFS Disks on Windows](https://hetmanrecovery.com/recovery_news/how-to-open-a-zfs-file-system-disk-in-windows.htm)


## Other Awesome ZFS
- [ZFS Filesystem Awesome Collection from kazaimazai](https://kazaimazai.com/zfs-caveats-and-references/)
- [mamh-mixed/awesome-zfs](https://github.com/mamh-mixed/awesome-zfs)



<!-- ## ZFS vs. other Filesystems -->
<!-- Btrfs
GlusterFS
Ceph
HDFS
Lustre
MinIO -->

## Links
- [ZFS CLI reference](https://www.zfshandbook.com/docs/references/command-reference/)
- [ZFS walkthrough](https://arstechnica.com/information-technology/2014/02/ars-walkthrough-using-the-zfs-next-gen-filesystem-on-linux/)
- [OpenZFS Releases](https://zfsonlinux.org/)
- [What is ZFS? Why are People Crazy About it?](https://itsfoss.com/what-is-zfs/)
- [Understanding ZFS RAID Levels: Types, Modes, and Configurations](https://www.diskinternals.com/raid-recovery/zfs-raid-types/)

<!-- ## Books -->

## Videos
- [Cockpit+ZFS Manager plugin](https://www.youtube.com/watch?v=1HEO7qXa6jo&t=745s)
- [Top Tools to Recover Data from ZFS Drives. How to Recover Data from ZFS File System](https://www.youtube.com/watch?v=Tk-Y9C8wBtg)
- [The BEST Linux filesystem encryption in 2020 ext4 vs btrfs vs zfs vs luks vs gocryptfs comparison](https://www.youtube.com/watch?v=4hE_WC4NyaQ&t=10s)
## License

This code is released under the GNU General Public License v3.0. See [LICENSE](LICENSE).
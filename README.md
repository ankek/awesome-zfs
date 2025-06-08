# Awesome OpenZFS [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

> OpenZFS is an open-source implementation of the ZFS file system and volume manager initially developed by Sun Microsystems for the Solaris operating system, and is now maintained by the OpenZFS Project. Similar to the original ZFS, the implementation supports features like data compression, data deduplication, copy-on-write clones, snapshots, RAID-Z, and virtual devices that can create filesystems that span multiple disks. 
> One of the main capabilities of OpenZFS is self-healing. The file system can detect and correct errors while in use, without the need for a dedicated file system checker. This feature makes it suitable for mission-critical applications that require high availability. 

## About
![Alt text](https://openzfs.github.io/openzfs-docs/_static/logo_main.png)
> A curated list of resources on [OpenZFS](https://openzfs.github.io/openzfs-docs/).
  
From :estonia: with :heart:.
## Support us

This project has no sponsors but we accepting donations to purchase hardware for OpenZFS [test rig](https://www.amazon.de/hz/wishlist/ls/ZF2AIF60C7X3?ref_=wl_share).  

You can support us these ways:
* :heart: Share the link to this [repo](https://github.com/ankek/awesome-zfs). 
* :star: Give us a GitHub star. 
* :trophy: [Buying us a coffee](https://coff.ee/zfstestrig)  

We would like to compare performance with same set of [hardware components](https://www.amazon.de/hz/wishlist/ls/ZF2AIF60C7X3?ref_=wl_share) and all the money from "Buy Me a Coffee" will be spent on hardware:
  - for RAIDZ (RAIDZ1 vs. RAIDZ2 vs. RAIDZ3)
  - for dRAID (dRAID1 vs. dRAID2 vs. dRAID3)
  - for other RAIDs, supported by OpenZFS like RAID0 vs. RAID1 vs. RAID10
  - with other FS (OpenZFS vs. Btrfs vs. GlusterFS vs. Ceph vs. HDFS vs. Lustre vs. MinIO)  

Please find more details about in [ZFS Performance Test scenario](https://github.com/ankek/awesome-zfs/blob/main/zfs-performance-test-scenario.md)

## Contents
- [Awesome OpenZFS ](#awesome-openzfs-)
  - [About](#about)
  - [Support us](#support-us)
  - [Contents](#contents)
  - [Legend](#legend)
  - [Official Resources](#official-resources)
    - [RAIDZ official doc](#raidz-official-doc)
    - [dRAID official doc](#draid-official-doc)
    - [RAID with ZFS](#raid-with-zfs)
  - [Tutorials](#tutorials)
    - [Beginner Guides](#beginner-guides)
    - [Snapshots, Backups and Replication](#snapshots-backups-and-replication)
    - [ZFS performance tuning and benchmarks](#zfs-performance-tuning-and-benchmarks)
    - [ZFS on root partition](#zfs-on-root-partition)
    - [ZFS Data Protection](#zfs-data-protection)
    - [ZFS Encryption](#zfs-encryption)
    - [ZFS RAID](#zfs-raid)
  - [ZFS tools](#zfs-tools)
    - [ZFS Calculators](#zfs-calculators)
    - [ZFS GUI](#zfs-gui)
    - [ZFS Monitoring](#zfs-monitoring)
    - [ZFS Backup tools](#zfs-backup-tools)
  - [ZFS Cheat Sheets](#zfs-cheat-sheets)
  - [ZFS on Windows](#zfs-on-windows)
  - [ZFS on Mac](#zfs-on-mac)
  - [Other Awesome ZFS](#other-awesome-zfs)
  - [ZFS troubleshooting](#zfs-troubleshooting)
  - [Videos](#videos)
  - [Contribution](#contribution)
  - [License](#license)

## Legend
- Abandoned :skull:
- Monetized :moneybag:
- Beta version :warning:

## Official Resources
- [Official website](https://openzfs.org/)
- [OpenZFS Releases](https://zfsonlinux.org/)
- [OpenZFS GitHub](https://github.com/openzfs/zfs)
- [Getting Started](https://openzfs.github.io/openzfs-docs/Getting%20Started/index.html)
### RAIDZ official doc
RAIDZ is a variation on RAID-5 that allows for better distribution of parity and eliminates the RAID-5 “write hole”. Data and parity is striped across all disks within a raidz group. RAIDZ is effective for large block sizes and sequential workloads.
- [RAIDZ documentation](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/RAIDZ.html)
### dRAID official doc
dRAID is a variant of [RAIDZ](#raidz) that provides integrated distributed hot spares which allows for faster resilvering while retaining the benefits of raidz.
- [dRAID documentation](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/dRAID%20Howto.html#introduction)
### RAID with ZFS
Open ZFS focused on [RAIDZ](#raidz-official-doc) and [dRAID](#draid-official-doc).
Meanwhile it also support other RAID types like Stripe and Mirror.
- [Simple ZFS Pools](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md#creating-simple-zfs-pools)

## Tutorials
### Beginner Guides
- [ZFS 101](https://arstechnica.com/information-technology/2020/05/zfs-101-understanding-zfs-storage-and-performance/)
- [ZFS Guide for starters and advanced users](https://forum.level1techs.com/t/zfs-guide-for-starters-and-advanced-users-concepts-pool-config-tuning-troubleshooting/196035)
- [What is ZFS? Why are People Crazy About it?](https://itsfoss.com/what-is-zfs/)
- [10 Reasons Why ZFS Rocks](https://www.enterprisestorageforum.com/hardware/10-reasons-why-zfs-rocks/)
- [ZFS walkthrough](https://arstechnica.com/information-technology/2014/02/ars-walkthrough-using-the-zfs-next-gen-filesystem-on-linux/)
- [ZFS CLI reference](https://www.zfshandbook.com/docs/references/command-reference/)
### Snapshots, Backups and Replication
- [Secure External Backup with ZFS Native Encryptionp](https://pipo.blog/articles/20210803-secure-zfs-encrypted-extbackup)
- [Sending and Receiving ZFS Data](https://docs.oracle.com/cd/E18752_01/html/819-5461/gbchx.html)
- [How to use snapshots, clones and replication in ZFS on Linux](https://www.howtoforge.com/tutorial/how-to-use-snapshots-clones-and-replication-in-zfs-on-linux/)
- [ZFS Snapshot Tools](https://klarasystems.com/articles/zfs-orchestration-part-1-zfs-snapshots-tools/)
- [Efficient ZFS Replication with Snapshots](https://klarasystems.com/articles/zfs-orchestration-tools-part-2-replication/)
- [Backup storage for thousands of virtual machines using free tools](https://blog.aenix.io/backup-storage-for-thousands-of-virtual-machines-using-free-tools-b3909004bef2)
### ZFS performance tuning and benchmarks
- [Managing and Tracking Storage Performance – OpenZFS Storage Bottlenecks](https://klarasystems.com/articles/managing-tracking-storage-performance-openzfs-bottlenecks/)
- [5 Reasons Why Your ZFS Storage Benchmarks Are Wrong](https://klarasystems.com/articles/5-reasons-why-your-zfs-storage-benchmarks-are-wrong/)
- [FreeBSD vs. Linux – Which Operating System to Use for OpenZFS](https://klarasystems.com/articles/running-openzfs-choosing-between-freebsd-and-linux/)
- [ZFS performance results](https://icesquare.com/wordpress/zfs-performance-mirror-vs-raidz-vs-raidz2-vs-raidz3-vs-striped/)
- [ZFS performance considerations](https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#performance-considerations)
### ZFS on root partition
- [ZFS Bootloader for root-on-ZFS systems](https://github.com/zbm-dev/zfsbootmenu)
### ZFS Data Protection
- [How OpenZFS Provides Data Integrity Where Other File Systems Don’t](https://www.truenas.com/blog/data-integrity-openzfs/)
  
### ZFS Encryption
- [ZFS native encryption kick-off article](https://arstechnica.com/gadgets/2021/06/a-quick-start-guide-to-openzfs-native-encryption/)
- [OpenZFS on OS X encryption support](https://openzfsonosx.org/wiki/Encryption)
- [ Tutorial on how to backup encrypted ZFS data on untrusted storage without the need of unlocking it.](https://mtlynch.io/zfs-encrypted-backups/)
- [How to install LUKS encrypted Server and enable remote unlocking tutorial](https://hamy.io/post/0009/how-to-install-luks-encrypted-ubuntu-18.04.x-server-and-enable-remote-unlocking/)

### ZFS RAID
- [ZFS RAID types](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md)
- [Understanding ZFS RAID Levels: Types, Modes, and Configurations](https://www.diskinternals.com/raid-recovery/zfs-raid-types/)
- [ZFS RAIDZ vs. traditional RAID](https://www.klennet.com/notes/2019-07-04-raid5-vs-raidz.aspx)
<!-- ## ZFS Testing -->

## ZFS tools
### ZFS Calculators
- [ZFS raidz calculator1](https://www.raidz-calculator.com/)
- [ZFS raidz calculator2](https://zfs-calculator.com/)
- [ZFS Capacity Calculator](https://www.truenas.com/docs/references/zfscapacitycalculator/)
- [ZFS / RAIDZ Capacity Calculator (beta)](https://wintelguy.com/zfs-calc.pl)

### ZFS GUI
- :skull:[Zyggy - Simple GUI for ZFS administration](https://github.com/manoeldesouza/zyggy)
- :moneybag:[Poolsman - Web UI for OpenZFS](https://www.poolsman.com/)
- :skull:[ZFS Commander](https://github.com/manoeldesouza/zc)
- :warning:[ZfDash ZFS Management GUI / WEBUI](https://github.com/ad4mts/zfdash)

### ZFS Monitoring
- [ZFS pool monitoring and notification daemon](https://github.com/rouben/zfswatcher)
- [Prometheus and ZFS](https://samber.github.io/awesome-prometheus-alerts/rules#zfs)

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
- [ZFS Cheat Sheet #1](https://github.com/ankek/awesome-zfs/blob/main/zfs-cheat-sheet.md)
- [ZFS Cheat Sheet #2](https://www.zfshandbook.com/docs/references/cheatsheet/)
- [ZFS Cheat Sheet #3](https://blog.mikesulsenti.com/zfs-cheat-sheet-and-guide/)
- [ZFS Cheatsheet + Backups tutorial](https://github.com/zenaan/quick-fixes-ftfw/blob/master/zfs/zfs.md)
- [ZFS tuning cheat sheet](https://jrs-s.net/2018/08/17/zfs-tuning-cheat-sheet/)
- [ZFS RAIDZ Expansion Is Awesome but Has a Small Caveat](https://louwrentius.com/zfs-raidz-expansion-is-awesome-but-has-a-small-caveat.html)

## ZFS on Windows
- [Accessing ZFS Disks on Windows](https://hetmanrecovery.com/recovery_news/how-to-open-a-zfs-file-system-disk-in-windows.htm)
- [Open ZFS on Windows](https://github.com/openzfsonwindows/openzfs)

## ZFS on Mac
- [OpenZFS on OS X ](https://github.com/openzfsonosx/zfs)
- :skull: [An extensive ZFS setup on MacOS](https://justinscholz.de/2018/06/15/an-extensive-zfs-setup-on-macos)
- :skull: [ZFS on macOS instructions and scripts](https://github.com/spl/zfs-on-mac)

## Other Awesome ZFS
- [ZFS Filesystem Awesome Collection from kazaimazai](https://kazaimazai.com/zfs-caveats-and-references/)
- [mamh-mixed/awesome-zfs](https://github.com/mamh-mixed/awesome-zfs)

## ZFS troubleshooting
- [ZFS/ ZoL quick fixes](https://github.com/zenaan/quick-fixes-ftfw/blob/master/zfs/README.md)
<!-- ## ZFS vs. other Filesystems -->
<!-- Btrfs
GlusterFS
Ceph
HDFS
Lustre
MinIO -->


<!-- ## Books -->

## Videos
- [Cockpit+ZFS Manager plugin](https://www.youtube.com/watch?v=1HEO7qXa6jo&t=745s)
- [Top Tools to Recover Data from ZFS Drives. How to Recover Data from ZFS File System](https://www.youtube.com/watch?v=Tk-Y9C8wBtg)
- [The BEST Linux filesystem encryption in 2020 ext4 vs btrfs vs zfs vs luks vs gocryptfs comparison](https://www.youtube.com/watch?v=4hE_WC4NyaQ&t=10s)
- [Explaining ZFS LOG and L2ARC Cache: Do You Need One and How Do They Work?](https://www.youtube.com/watch?app=desktop&v=M4DLChRXJog)
- [Tuesday Tech Tip - ZFS Best Practices](https://www.youtube.com/watch?app=desktop&v=oWneomAYpZY)
<!-- - [TrueNAS Tutorial: Expanding Your ZFS RAIDz VDEV with a Single Drive](https://www.youtube.com/watch?app=desktop&v=uPCrDmjWV_I) -->
- [ZFS Basics - Pools and VDEVs - Testing, Configuration, and Expansion](https://www.youtube.com/watch?app=desktop&v=IN_bTYYSXvU)
- [ZFS Boot Menu - I put that stuff on everything](https://www.youtube.com/watch?app=desktop&v=FRo65qnK_70)
- [ZFS 101: Leveraging Datasets and Zvols for Better Data Management](https://www.youtube.com/watch?app=desktop&v=0d4_nvdZdOc)
- [OpenZFS novel algorithms: snapshots, space allocation, RAID-Z - Matt Ahrens](https://www.youtube.com/watch?v=uJGkyMxdNFE)
- [Lecture on OpenZFS read and write code paths - Matt Ahrens](https://www.youtube.com/watch?v=ptY6-K78McY)
- [OpenZFS Basics by Matt Ahrens and George Wilson](https://www.youtube.com/watch?v=MsY-BafQgj4)
- [Software Tools to Read a ZFS Disk in Windows / How to Open a ZFS Disk in Windows](https://www.youtube.com/watch?v=uNQRt68gCnY)
- [Project ZeroFault: OpenZFS-Level Safeguards Against Pool Faults](https://www.youtube.com/watch?v=mIctukeskiU)

## Contribution
Your [contributions](https://github.com/ankek/awesome-zfs/blob/main/contributing.md) are welcome!
 
## License
This code is released under the GNU General Public License v3.0. See [LICENSE](LICENSE).

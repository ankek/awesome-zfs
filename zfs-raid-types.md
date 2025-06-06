# What is RAID?
RAID (Redundant array of inexpensive/independent disks) is a data storage virtualization technology that combines multiple physical data storage components into one or more logical units for the purposes of data redundancy, performance improvement, or both.
# Standard RAID levels
RAID levels and their associated data formats are standardized by the Storage Networking Industry Association (SNIA) in the Common RAID Disk Drive Format (DDF) standard. Please read Wiki page [Standard RAID levels](https://en.wikipedia.org/wiki/Standard_RAID_levels),[](https://en.wikipedia.org/wiki/Nested_RAID_levels) and  to get more details.
# ZFS RAID types
ZFS user number in the name of RAID (like RAIDZ1) and it may confuse.
Number in ZFS RAID means RAID parity, not RAID level.
RAIDZ is not exactly the same but very similar equivalent of Standard RAID with benefits of ZFS.
For file storages with more than 12 disks ZFS developers propose to use [dRAID](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/dRAID%20Howto.html).

# Comparison table
| Standard RAID level | ZFS RAID type | Description | Available Storage |
|------|-------|--------|--------|
| RAID 0 | Striped ZFS Pool | Data stripe | ~97% |
| RAID 1 | Mirrored ZFS Pool | Data mirror | ~50% |
| RAID 5 | RAIDZ1 | Data stripe with single distributed parity| ~64% |
| RAID 6 | RAIDZ2 | Data stripe with double distributed parity| ~47% |
| RAID 7 | RAIDZ3 | Data stripe with triple distributed parity| ~38% |
| RAID 10 (1+0) | Stripe of Mirrored ZFS Pools | Data stripe with series of mirrored drives| ~49% |
<!-- | RAID 50 | Stripe of RAIDZ1 | Data stripe with single distributed parity| ~83% |
| RAID 60 | Stripe of RAIDZ2 | Data stripe with double distributed parity| ~67% |
| RAID 70 | Stripe of RAIDZ3 | Data stripe with triple distributed parity|| -->

# Examples


## Striped ZFS Pool (RAID 0)

```
$ zpool status -v tank-stripe
pool: tank-stripe
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
        /dev/sda1  	ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0

errors: No known data errors
```
## Mirrored ZFS Pool (RAID 1)
```
$ zpool status -v tank-mirror
pool: tank-mirror
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      mirror-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
      mirror-1      ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0

errors: No known data errors
```
## RAIDZ1 (RAID 5)
```
$ zpool status -v tank-raidz1
pool: tank-raidz1
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz1-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0

errors: No known data errors
```

## RAIDZ2 (RAID 6)

```
$ zpool status -v tank-raidz2
pool: tank-raidz2
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz2-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0

errors: No known data errors
```
## RAIDZ3 (RAID 7)
```
$ zpool status -v tank-raidz3
pool: tank-raidz3
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz3-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0
        /dev/sde1   ONLINE       0     0     0

errors: No known data errors
```
## Mirror of Striped ZFS Pool (RAID 10/1+0)
The array can sustain multiple drive losses so long as no mirror loses all its drives.
```
$ zpool status -v tank-ten
pool: tank-ten
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      mirror-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
      mirror-1      ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0

errors: No known data errors
```
<!-- ## RAIDZ1 with mirror (RAID 50)
```
$ zpool status -v tank-fifty
pool: tank-fifty
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz1-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
      raidz1-1      ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0
        /dev/sde1   ONLINE       0     0     0
        /dev/sdf1   ONLINE       0     0     0

errors: No known data errors
```
## RAIDZ2 with mirror (RAID 60)
```
$ zpool status -v tank-sixty
pool: tank-sixty
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz2-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0
      raidz2-1      ONLINE       0     0     0
        /dev/sde1   ONLINE       0     0     0
        /dev/sdf1   ONLINE       0     0     0
        /dev/sdg1   ONLINE       0     0     0
        /dev/sdh1   ONLINE       0     0     0

errors: No known data errors
```

## RAIDZ3 with mirror (RAID 70)
```
$ zpool status -v tank-seventy
pool: tank-seventy
state: ONLINE
config:
    NAME            STATE     READ WRITE CKSUM
    tank            ONLINE       0     0     0
      raidz3-0      ONLINE       0     0     0
        /dev/sda1   ONLINE       0     0     0
        /dev/sdb1   ONLINE       0     0     0
        /dev/sdc1   ONLINE       0     0     0
        /dev/sdd1   ONLINE       0     0     0
        /dev/sde1   ONLINE       0     0     0
      raidz3-1      ONLINE       0     0     0
        /dev/sdf1   ONLINE       0     0     0
        /dev/sdg1   ONLINE       0     0     0
        /dev/sdh1   ONLINE       0     0     0
        /dev/sdi1   ONLINE       0     0     0
        /dev/sdj1   ONLINE       0     0     0

errors: No known data errors
```
 -->

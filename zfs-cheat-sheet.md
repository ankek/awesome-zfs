# OpenZFS Cheat Sheet


 ZFS requires root privileges so either be root or use sudo/doas/etc

# Contents
- [Overview](#openzfs-cheat-sheet)
- [Content](#contents)
  - [Identifying Drives](#identifying-drives)
  - [RAID-Z Type Pools](#raid-z-type-pools)
  - [Creating simple ZFS Pools](#creating-simple-zfs-pools)

# Identifying Drives
Use /dev/disk/by-id/ directory in Linux to see what the drive IDs are. 
```
lsblk -o NAME,SIZE,MODEL,FSTYPE,LOG-SEC,PHY-SEC,SERIAL,MOUNTPOINT
```


# RAID-Z Type Pools
## Which RAID-Z level should I choose?

RAID-Z1 can be useful if you're on a budget and your ability to quickly change out a failed drive. SSDs can work well on RAID-Z1 due to how they most likely won't die from resilvering a new drive replacement and can do it very quickly, as well as maximizing the space utilization.

You will have to decide based on your needs and your drives. The safest best is to choose RAID-Z2 by default. If you value your data, then RAID-Z3. 

## RAID-Z Pool (RAID-Z1)

* Min Drives: 3
* Fault Tolerance: 1 Drive
* Drive Space Overhead: 1 Drive
* Read / Write Speed: # of Drives - 1 / Single Drive Speed
```
zpool create POOLNAME raidz drive1-name-serial drive2-name-serial drive3-name-serial drive4-name-serial ...
```

## RAID-Z2 Pool

* Min Drives: 4
* Fault Tolerance: 2 Drives
* Drive Space Overhead: 2 Drives
* Read / Write Speed: # of Drives - 2 / Single Drive Speed
```
zpool create POOLNAME raidz2 drive1-name-serial drive2-name-serial drive3-name-serial drive4-name-serial ...
```
## RAID-Z3 Pool

* Min Drives: 5
* Fault Tolerance: 3 Drives
* Drive Space Overhead: 3 Drives
* Read / Write Speed: # of Drives - 3 / Single Drive Speed
```
zpool create POOLNAME raidz3 drive1-name-serial drive2-name-serial drive3-name-serial drive4-name-serial drive5-name-serial ...
```

# Creating simple ZFS Pools
> [!WARNING]  
> This is replacement of RAIDZ pools within OpenZFS.
> Please use RAIDZ instead of this.

> [!NOTE]  
> If you're running high IO intensive applications like databases on ZFS, you may want to consider ZFS RAID 10 and not a RAID-Z, since it will have the best write speeds.

## Single Drive Pool

* Min/Max Drives: 1/1
* Fault Tolerance: None
* Drive Space Overhead: None
* Read / Write Speed: Native Drive Speed

```
zpool create POOLNAME drive1-name-serial
```

## Striped (RAID 0) Pool

* Min Drives: 1
* Fault Tolerance: None
* Drive Space Overhead: None
* Read / Write Speed: Native speed multiplied by # of Drives
```
zpool create POOLNAME drive1-name-serial drive2-name-serial
```
## Mirrored (RAID 1) Pool

* Min Drives: 2
* Fault Tolerance: (# of Drives) - 1
* Drive Space Overhead: ((# of Drives) - 1) / (# of Drives)
* Read / Write Speed: 2x Drives / Native Drive Speed
```
zpool create POOLNAME mirror drive1-name-serial drive2-name-serial
```

## Striped + Mirrored (RAID 10) Pool

* Min Drives: 4
* Fault Tolerance: (# of Drives in each mirror) - 1
* Drive Space Overhead: ((# of Drives) x Parity Stripes over # of Mirrors
* Read / Write Speed: Typically 2x Drives / 2x Drives - Read speed increases with # of mirror groups
```
zpool create POOLNAME mirror drive1-name-serial drive2-name-serial mirror drive3-name-serial drive4-name-serial
```

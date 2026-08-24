# Data Integrity and Self-Healing

ZFS was built from the ground up to prioritize data integrity. One of its most advanced and distinguishing features is its ability to detect and correct data corruption automatically. This section covers how ZFS achieves this through **checksumming**, **scrubbing**, and **resilvering**.

## Checksumming and Data Verification

At the heart of ZFS's data integrity model is **checksumming**. Every block of data written to a ZFS pool is accompanied by a checksum — a small piece of metadata that represents the contents of the block. When data is read from the disk, ZFS compares the stored data against its checksum to ensure that it has not been altered or corrupted.

This process happens at all levels within the ZFS hierarchy, from individual blocks of data to entire files. Each time a file is read, ZFS automatically verifies its contents against the checksum. If the data does not match its checksum, ZFS flags the block as corrupted.

This ability to detect corruption is critical because silent data corruption, also known as **bit rot**, can occur at any time due to hardware malfunctions, power surges, or even cosmic rays. With ZFS, this corruption is detected before it causes problems, ensuring that the integrity of the data is always maintained.

## Scrubbing and Resilvering

**Scrubbing** is a process in ZFS that verifies the integrity of all data within a pool. Unlike checksumming, which occurs whenever data is read, scrubbing actively reads through all blocks of data in the pool and verifies them against their checksums, even if they are not currently being accessed. Scrubbing is typically scheduled as a regular maintenance task and is essential for discovering latent data corruption that may not otherwise be detected.

During a scrub, ZFS reads each block of data in the pool, verifies the checksum, and repairs any corrupted blocks using redundant copies stored elsewhere in the pool. For example, if ZFS finds a corrupt block in a mirrored VDEV, it will automatically retrieve the correct data from the healthy disk and rewrite it to the corrupted disk.

To initiate a scrub, the following command is used:

```bash
zpool scrub mypool
```

This process is non-destructive and can be performed while the pool is actively being used. It is an important part of maintaining the health of a ZFS pool, especially in large-scale deployments where the risk of data corruption increases over time.

Resilvering is another key process in ZFS, used to rebuild a degraded VDEV after a disk failure. When a disk in a RAID-Z or mirrored VDEV fails and is replaced, ZFS reconstructs the lost data onto the new disk. This process is called resilvering.

Unlike traditional RAID systems that rebuild entire disks from scratch, ZFS only resilvers the blocks that contain actual data. This approach significantly reduces the time required to restore a pool to full health after a disk failure.

The status of a resilvering process can be monitored using:

```bash
zpool status
```

The output will show the progress of the resilvering operation and provide an estimate of its completion. Just like scrubbing, resilvering can occur while the pool is still being used, minimizing downtime during the recovery process.
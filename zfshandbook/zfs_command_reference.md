# ZFS  Command Reference
## Pool Management (|zpool Commands)
|Command	|Description	|Example Usage|
|---|---|---|
|zpool create	|Creates a new |zfs storage pool.	|zpool create mypool /dev/sda|
|zpool destroy	|Destroys an existing pool. This action is irreversible.	|zpool destroy mypool|
|zpool status	|Displays the status of all |zfs pools and their associated devices.	|zpool status|
|zpool list	|Lists all active pools with their basic properties.	|zpool list|
|zpool add	|Adds a new device to an existing pool.	|zpool add mypool /dev/sdb|
|zpool remove	|Removes a device from an existing pool.	|zpool remove mypool /dev/sdb|
|zpool scrub	|Initiates a scrub to verify data integrity and correct errors if necessary.	|zpool scrub mypool|
|zpool import	|Imports an existing pool.	|zpool import mypool|
|zpool export	|Exports a pool, making it unavailable for use on the current system.	|zpool export mypool|
|zpool upgrade	|Upgrades the pool to the latest |zfs version.	|zpool upgrade mypool|
|zpool history	|Displays a history of all operations performed on the pool.	|zpool history mypool|
|zpool iostat	|Shows input/output statistics for each pool.	|zpool iostat mypool|
## Dataset Management (ZFS  Commands)
|Command	|Description	|Example Usage|
|---|---|---|
|zfs create	|Creates a new dataset within a pool.	|zfs create mypool/mydataset|
|zfs destroy	|Destroys a dataset. This action is irreversible.	|zfs destroy mypool/mydataset|
|zfs list	|Lists all datasets in a pool along with properties such as used and available space.	|zfs list|
|zfs get	|Displays specific properties of datasets.	|zfs get compressratio mypool/mydataset|
|zfs set	|Sets a property for a dataset.	|zfs set compression=lz4 mypool/mydataset|
|zfs mount	|Mounts a dataset.	|zfs mount mypool/mydataset|
|zfs unmount	|Unmounts a dataset.	|zfs unmount mypool/mydataset|
|zfs rename	|Renames a dataset.	|zfs rename mypool/mydataset mypool/newdataset|
|zfs clone	|Creates a writable clone of a snapshot.	|zfs clone mypool@mysnapshot mypool/myclone|
|zfs promote	|Promotes a clone to a full dataset, allowing it to be modified independently.	|zfs promote mypool/myclone|
## Snapshot Management
|Command	|Description	|Example Usage|
|---|---|---|
|zfs snapshot	|Creates a snapshot of a dataset or volume.	|zfs snapshot mypool/mydataset@mysnapshot|
|zfs list -t snapshot	|Lists all snapshots in the system.	|zfs list -t snapshot|
|zfs destroy	|Destroys a snapshot. This action is irreversible.	|zfs destroy mypool/mydataset@mysnapshot|
|zfs rollback	|Rolls back a dataset to a specific snapshot.	|zfs rollback mypool/mydataset@mysnapshot|
|zfs send	|Sends a snapshot to another location, usually for backup purposes.	|zfs send mypool/mydataset@mysnapshot > /backup/mysnapshot|
|zfs receive	|Receives a snapshot from a send operation.	|zfs receive mypool < /backup/mysnapshot|
## Performance Tuning
|Command	|Description	|Example Usage|
|---|---|---|
|zfs set atime=off	|Disables access time updates, improving performance for certain workloads.	|zfs set atime=off mypool/mydataset|
|zfs set recordsize	|Sets the record size for a dataset, which can be adjusted to optimize performance.	|zfs set recordsize=128K mypool/mydataset|
|zfs set compression	|Enables compression for a dataset, improving space efficiency.	|zfs set compression=lz4 mypool/mydataset|
|zfs set dedup=on	|Enables deduplication, though it can impact performance.	|zfs set dedup=on mypool|
|zfs set sync=disabled	|Disables synchronous writes, which can improve performance but may risk data loss in the event of a crash.	|zfs set sync=disabled mypool/mydataset|
|zpool iostat	|Displays I/O statistics, useful for monitoring performance.	|zpool iostat mypool|
|zpool set cachefile	|Configures the location of the |zfs pool cache to improve performance for multiple pools.	|zpool set cachefile=/etc/zfs/zpool.cache mypool|
## Backup and Recovery
|Command	|Description	|Example Usage|
|---|---|---|
|zfs send	|Sends a snapshot to another location for backup.	|zfs send mypool/mydataset@mysnapshot > /backup/mysnapshot|
|zfs send -i	|Sends an incremental snapshot (only the changes since the last snapshot).	|zfs send -i mypool@oldsnapshot mypool@newsnapshot > /backup/incremental|
|zfs receive	|Receives a snapshot from a |zfs send operation.	|zfs receive mypool < /backup/mysnapshot|
|zpool import	|Imports a pool from another system, typically used in recovery scenarios.	|zpool import mypool|
|zpool export	|Exports a pool so it can be imported on another system.	|zpool export mypool|
|zpool scrub	|Initiates a scrub to verify data integrity and correct errors.	|zpool scrub mypool|
## Troubleshooting
|Command	|Description	|Example Usage|
|---|---|---|
|zpool status	|Displays the status of the pool and identifies any errors or degraded devices.	|zpool status|
|zpool clear	|Clears error counts and resumes normal operation after a device failure.	|zpool clear mypool|
|zfs list -o	|Displays dataset properties to help diagnose issues.	|zfs list -o name,used,available|
|zpool iostat	|Provides I/O statistics, which can help identify performance bottlenecks.	|zpool iostat mypool|
|zpool events	|Displays events related to the |zfs pool, such as device failures or errors.	|zpool events|
|zdb	|zfs debugger for advanced troubleshooting.	|zdb -e mypool|


source: https://www.zfshandbook.com/docs/references/command-reference/
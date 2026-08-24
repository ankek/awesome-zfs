# ZFS Cheat Sheet
## Pool Management
|Command	|Description	|Example|
|---|---|---|
|zpool create	|Create a new ZFS pool	|zpool create mypool /dev/sda|
|zpool destroy	|Destroy a ZFS pool (irreversible)	|zpool destroy mypool|
|zpool status	|Check the status of pools and devices	|zpool status|
|zpool list	|List all active pools	|zpool list|
|zpool add	|Add a device to an existing pool	|zpool add mypool /dev/sdb|
|zpool remove	|Remove a device from the pool	|zpool remove mypool /dev/sdb|
|zpool scrub	|Start a scrub for data integrity	|zpool scrub mypool|
## Dataset Management
|Command	|Description	|Example|
|---|---|---|
|zfs create	|Create a new dataset	|zfs create mypool/mydataset|
|zfs destroy	|Destroy a dataset	|zfs destroy mypool/mydataset|
|zfs list	|List all datasets	|zfs list|
|zfs set	|Set a property on a dataset	|zfs set compression=lz4 mypool/mydataset|
|zfs get	|Get properties of a dataset	|zfs get all mypool/mydataset|
|zfs rename	|Rename a dataset	|zfs rename mypool/oldname mypool/newname|
## Snapshot Management
|Command	|Description	|Example|
|---|---|---|
|zfs snapshot	|Create a snapshot	|zfs snapshot mypool/mydataset@snap1|
|zfs destroy	|Destroy a snapshot	|zfs destroy mypool/mydataset@snap1|
|zfs rollback	|Roll back to a snapshot	|zfs rollback mypool/mydataset@snap1|
|zfs list -t snapshot	|List all snapshots	|zfs list -t snapshot|
## Backup and Replication
|Command	|Description	|Example|
|---|---|---|
|zfs send	|Send a snapshot	|zfs send mypool/mydataset@snap1 > /backup/snap1|
|zfs receive	|Receive a snapshot	|zfs receive mypool < /backup/snap1|
|zfs send -i	|Send an incremental snapshot	|zfs send -i snap1 snap2 > /backup/incr|
## Performance Tuning
|Command	|Description	|Example|
|---|---|---|
zfs set atime=off	Disable access time updates	zfs set atime=off mypool/mydataset|
zfs set recordsize	Set the record size for a dataset	zfs set recordsize=128K mypool/mydataset|
zfs set compression	Enable compression	zfs set compression=lz4 mypool/mydataset|
## Troubleshooting
|Command	|Description	|Example|
|---|---|---|
|zpool status	|Check pool status for errors	|zpool status|
|zpool clear	|Clear errors from a pool	|zpool clear mypool|
|zpool scrub	|Scrub the pool to repair errors	|zpool scrub mypool|
|zpool iostat	|Show I/O stats for the pool	|zpool iostat mypool|
|zdb	|ZFS debugger for advanced troubleshooting	|zdb -e mypool|
## Common ZFS Properties
|Property	|Description	|Example|
|---|---|---|
|compression	|Enables compression (e.g., lz4, gzip)	|zfs set compression=lz4 mypool|
|dedup	|Enables deduplication	|zfs set dedup=on mypool|
|sync	|Configures sync behavior	|zfs set sync=disabled mypool/mydataset|
|atime	|Controls access time updates	|zfs set atime=off mypool/mydataset|
|quota	|Sets a dataset quota	|zfs set quota=10G mypool/mydataset|
## Best Practices

Regular Scrubbing: Scrub your pools regularly to ensure data integrity:
```
zpool scrub mypool
```
Snapshots for Backup: Take regular snapshots for backups:
```
zfs snapshot mypool/mydataset@snap1
```
Compression: Enable compression to save space with minimal performance impact:
```
zfs set compression=lz4 mypool/mydataset
```
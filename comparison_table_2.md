# Comparison table for Btrfs, ext4, Lustre, NTFS, ReFS, ReiserFS, Reiser4, XFS, ZFS

## General information
|File system            |Btrfs  |ext4   |Lustre |NTFS   |ReFS   |ReiserFS   |Reiser4    |XFS    |ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Year of introduction   |2007   |2006   |2002   |1993   |2012   |2004       |2001       |1994|2004|
|Original operating system |Linux |Linux |Linux |Windows NT 3.1 |Windows Server 2012| Linux |Linux |IRIX|Solaris|

## Metadata
|File system |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|XFS|ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Stores file owner |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|POSIX file permissions |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Creation timestamps |Yes |Yes |No |Yes |Yes |No |No |Yes |Yes|
|Last access/ read timestamps |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Last metadata change timestamps |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Last archive timestamps |No |No |No |No |No |No |No |No |Yes|
|Access control lists |Yes |Yes |Yes |Yes |Yes |No |Yes |Yes |Yes|
|Security/ MAC labels |Yes |Yes |Yes |Yes |No |No |Yes |Yes |Yes|
|Extended attributes/  Alternate data streams/forks |Yes |Yes |Yes |Yes |Yes |No |Yes |Yes |Yes|
|Metadata checksum/ ECC |Yes |Partial |No |No |Yes |No |No |Yes |Yes|

# Features
## File capabilities
|File system |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|XFS|ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Hard links |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Symbolic links |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Block journaling |Yes |Yes |Yes |No |? |Yes |Yes |Yes |Yes|
|Metadata-only journaling |No |Yes |Yes |Yes |? |No |Yes |Yes |No|
|Case-sensitive |Yes |Yes, optional |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Case-preserving |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|File Change Log |? |No |Yes |Yes |? |No |No |Yes |No|
|XIP |? |Yes |No |? |? |? |? |? |No
|Resident files |Yes |Yes |? |Yes|? |? |? |? |Yes|
|Resident files (inline data) |2048 bytes|~160 bytes|? |~700 bytes|? |? |? |? |112 bytes|

## Block capabilities
|File system |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|ZFS|
|---|---|---|---|---|---|---|---|---|
|Internal snapshotting / branching |Yes |No |No |No |No |? |No |Yes|
|Encryption |No |Yes, experimental |No |Yes |No |Yes |No |Yes|
|Deduplication |Yes |No |No |Yes |Yes |? |No |Yes|
|Data checksum/ ECC |Yes |No |No |No |No |No |No |Yes|
|Persistent Cache |No |No |Yes |No |No |No |No |Yes|
|Multiple Devices |Yes |No |Yes |No |No |No |No |Yes|
|Compression |Yes |No |No |Yes |No|No |Yes |No |Yes|
|Self-healing |Yes |No |No |No |No|No |No |No |Yes|
 
## Resize capabilities
|File system| Btrfs|ext4|Lustre|NTFS |ReFS |Reiser4| ReiserFS |XFS |ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Host OS |Linux |Linux |Linux |Windows |Windows |Linux |Linux |Linux |misc.|
|Offline grow ("Not mounted") |Yes |Yes |? |Yes |? |Yes |Yes |No |No|
|Online grow ("mounted") |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Offline shrink ("Not mounted") |Yes |Yes |No |Yes |? |Yes |Yes |No |No|
|Online shrink ("mounted") |Yes |No |No |Yes |No |No |No |No |Yes|
|Add and remove physical volumes|Yes |Yes |No |Yes |No |No |No |No |No |Partial|

## Allocation and layout policies

|Feature |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|XFS|ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Sparse files |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes |Yes|
|Block suballocation  |Yes |No |No |Partial |? |Yes |Yes |No |Yes|
|Tail packing |No |No |No |No |? |Yes |Yes |No |No|
|Extents |Yes |Yes |Yes |Yes |? |Yes |No |Yes |No|
|Variable file block size |Yes |No |No |No |No |No |No |No |Yes|
|Allocate-on-flush  |Yes |Yes |Yes |No |? |Yes |No |Yes |Yes|
|Copy on write |Yes |No |? |? |Yes |? |? |Yes, on request |Yes|
|Trim support |Yes |Yes |? |Yes |Yes |? |Testing|Yes (Linux) |Yes|

## OS support
|OS name |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|XFS|ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Linux |Yes |Yes |Yes[86] |Yes. Native since Linux Kernel 5.15|Needs Paragon ReFS for Linux |Yes. With a kernel patch |Yes |Yes |Yes. As an external kernel module|
|macOS |?| Needs Paragon ExtFS |?| Read only, write support with ntfs-3g |? |? |? |? |Yes|
|Windows (current) |Yes |Yes, with the optional WSL2; physical and VHDX virtual disks.|No |Yes |Yes |No |No |Yes|Yes|
|FreeBSD |No |Yes  |No |Yes with ntfs-3g |? |No |Partial |Partial |Yes|
|Android |No |Yes |No |With third party tools |No |No |No |No |No


## Limits
|Feature |Btrfs|ext4|Lustre|NTFS|ReFS|ReiserFS|Reiser4|XFS|ZFS|
|---|---|---|---|---|---|---|---|---|---|
|Maximum filename length |255 bytes |255 bytes |255 bytes |255 characters  |255 UTF-16 characters |3,976 bytes |4,032 bytes/255 characters |255 bytes |1023 bytes|
|Maximum pathname length |No limit defined |No limit defined |No limit defined| 32,767 characters with each path component (directory or filename) up to 255 characters long|32,767 characters with each path component (directory or filename) up to 255 characters long |No limit defined |No limit defined |No limit defined |No limit defined|
|Maximum file size |16 EiB (18.44 EB) |16 GiB (17.17 GB)|16 EiB (18.44 EB) on ZFS |16 TiB (17.59 TB)| 16 EiB (18.44 EB)| 8 TiB (8.796 TB) |8 TiB (8.796 TB) |8 EiB (9.223 EB) |16 EiB (18.44 EB)|
|Maximum volume size |16 EiB (18.44 EB) |1 EiB (1.152 EB) |16 EiB (18.44 EB) |16 TiB (17.59 TB)| 1 YiB (1.208 YB) |16 TiB (17.59 TB) |? |8 EiB (9.223 EB) |256 trillion yobibytes (2^128 bytes)|
|Maximum volume size in TB |18,440,000 TB |1,152,000 TB |18,440,000 TB |17.59 TB| 1,460,382,390,094 TB |17.59 TB |? |9,223,000 TB |~340,282,366,920,938,463,463,374,607 TB|
|Max number of files |2^64 |2^32 |? |2^32 |? |? |? |2^64 |2^128

<!-- [dfh](https://en.wikipedia.org/wiki/Comparison_of_file_systems) -->
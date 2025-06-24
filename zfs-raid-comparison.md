# RAIDZ levels comparison

||ZFS Stripe|ZFS Mirror|RAIDZ1|RAIDZ2|RAIDZ3|ZFS Stripe of mirrors|
|---|---|---|---|---|---|---|
|Min number of disks | 1  |2 | 2 | 4 | 5 | 4 |
|Fault to­le­ran­ce     | None | (N-1) disk | 1 disk | 2 disks | 3 disks | (N-1) disk in each N-disk mirror |
|Disk space over­head | None | (N-1)/N| 1 disk | 2 disks | 3 disks | (N-1)*P for P stipe over N-disk mirrors |
|Usable Storage      | ~97% | ~50% | ~64% | ~47% | ~38% | ~49% |
|Read speed          | Very fast | Fast | Slow | Slow | Slow | Fast |
|Write speed         | Very fast | Fair | Slow | Slow | Slow | Fair |
|Hard­ware cost       | Cheap | High to highest | High | Very high | Very High (disks) | High to highest |
|Summary|Unreliable storage of relatively large capacity | Reliable storage of relatively small capacity| Large, reliable, relatively expensive but slow storage| Large, highly reliable, relatively expensive but slow storage |  Large, highly reliable, relatively expensive but slow storage| Large, fast, reliable, but expensive storage |

## ZFS Stripe
Sharing of data between disks in ZFS Stripe looks like:
|Disk 1|Disk 2|
|---|---|
|1|2|
|3|4|
|5|6|

## ZFS Mirror
|Disk 1|Disk 2|
|---|---|
|1|2|
|3|1|
|2|3|

## RAIDZ
|Disk 1|Disk 2|Disk 3|
|---|---|---|
|A1|A2|Ap|
|B1|B2|Bp|
|C1|C2|Cp|

## RAIDZ2
|Disk 1|Disk 2|Disk 3|Disk 4|
|---|---|---|---|
|A1|A2|Ap|Ap|
|Bp|B2|Bp|B1|
|C1|Cp|Cp|C2|

## RAIDZ3
|Disk 1|Disk 2|Disk 3|Disk 4|Disk 5|
|---|---|---|---|---|
|A1|A2|Ap|Ap|Ap|
|Bp|B2|Bp|B1|Bp|
|C1|Cp|Cp|Cp|C2|

## ZFS Stripe of mirrors
|Disk 1|Disk 2|Disk 3|Disk 4|
|---|---|---|---|
|A1|A1|A2|A2|
|A3|A3|A4|A4|
|A5|A5|A6|A6|
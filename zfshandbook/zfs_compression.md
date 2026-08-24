# Compression

ZFS offers transparent compression, meaning that data is compressed before being written to disk and decompressed automatically when read. Compression can significantly reduce storage space usage and, in some cases, improve performance by reducing the amount of data that needs to be written to and read from disk.

## Available Compression Algorithms

ZFS supports several compression algorithms, each optimized for different workloads. The following are the primary compression algorithms available:

| Algorithm | Description | Compression Ratio | Performance | Use Case |
| --- | --- | --- | --- | --- |
| [`lz4`](https://web.archive.org/web/20250405100216/https://www.zfshandbook.com/docs/advanced-zfs/compression/#lz4) | High-speed compression with a balance of performance and ratio. | Moderate (2:1) | Fast compression and decompression. | General-purpose workloads, logs, databases, etc. |
| [`lzjb`](https://web.archive.org/web/20250405100216/https://www.zfshandbook.com/docs/advanced-zfs/compression/#lzjb) | Older algorithm, predecessor of `lz4`. | Moderate (similar to `lz4`) | Slower than `lz4`, but suitable for legacy systems. | Legacy systems or backward compatibility. |
| [`zle`](https://web.archive.org/web/20250405100216/https://www.zfshandbook.com/docs/advanced-zfs/compression/#zle-zero-length-encoding) | Compresses zero-filled blocks. | High, but only for zero-filled blocks. | Minimal performance impact. | Virtual machine images and datasets with zero-filled blocks. |
| [`gzip`](https://web.archive.org/web/20250405100216/https://www.zfshandbook.com/docs/advanced-zfs/compression/#gzip) | Offers compression levels from `gzip-1` to `gzip-9`, with varying performance. | High (up to 10:1) | Slower, with higher CPU usage. | Archival data, backups, where storage efficiency is critical. |
| [`zstd`](https://web.archive.org/web/20250405100216/https://www.zfshandbook.com/docs/advanced-zfs/compression/#zstd-zstandard) | Newer algorithm, faster than `gzip` with better ratios. | High | Faster than `gzip`, moderate CPU usage. | Suitable for archival data and large files. |

### lz4

**Description**: `lz4` is a high-speed compression algorithm that provides a good balance between compression ratio and performance. It is the default and most recommended algorithm for general-purpose use.

**Compression Ratio**: Moderate (typically 2:1).

**Performance**: Fast compression and decompression.

**Use Case**: Suitable for most workloads, especially when low CPU overhead and fast performance are required. Ideal for datasets where compression benefits are moderate but speed is important.

* * *

### lzjb

**Description**: `lzjb` is an older, lightweight compression algorithm that was used by ZFS before `lz4` became the default.

**Compression Ratio**: Moderate (similar to `lz4`, but slightly less efficient).

**Performance**: Good for legacy systems but generally slower and less efficient than `lz4`.

**Use Case**: Typically used for older systems that may not support newer algorithms or where backward compatibility is required.

* * *

### zle (Zero-Length Encoding)

**Description**: `zle` is a simple compression algorithm that compresses blocks filled with zeroes. It is useful in environments where many zero-filled blocks are written.

**Compression Ratio**: High, but only effective with zero-filled data.

**Performance**: Minimal impact on performance.

**Use Case**: Used in scenarios like virtual machine images where zero-filled blocks are common.

* * *

### gzip

**Description**: The `gzip` compression algorithm offers various levels of compression (`gzip-1` to `gzip-9`), with `gzip-9` providing the highest compression ratio but also the most CPU overhead.

**Compression Ratio**: High (up to 10:1 in some cases).

**Performance**: Slower compression and decompression compared to `lz4`, with higher CPU usage.

**Use Case**: Best suited for archival data, backups, and datasets where maximizing storage efficiency is more important than real-time performance. The `gzip` algorithm is configurable with levels ranging from 1 (fastest) to 9 (most space-saving).

* * *

### zstd (Zstandard)

**Description**: `zstd` is a relatively new compression algorithm designed to offer faster compression speeds and better compression ratios than `gzip`. It provides different levels of compression, similar to `gzip`.

**Compression Ratio**: High, with better performance than `gzip`.

**Performance**: Faster than `gzip`, but still has a moderate CPU overhead.

**Use Case**: Suitable for scenarios requiring a balance between compression ratio and performance, often used for archival data and large files.

## Choosing the Right Compression for Your Data

When selecting a compression algorithm for a dataset, several factors should be considered to achieve the optimal balance between performance and storage efficiency.

### Workload Type

For general-purpose workloads, **`lz4`** is recommended due to its low overhead and good balance between compression ratio and performance. It is ideal for databases, logs, and most file systems where real-time performance is important.

For archival or backup purposes, where compression ratio is prioritized over speed, **`gzip-9`** or **`zstd`** are better choices. These algorithms offer a higher compression ratio at the cost of slower writes and higher CPU usage.

### Data Characteristics

If the dataset contains many zero-filled blocks, such as in virtual machine images or sparse files, **`zle`** can be used to eliminate unnecessary disk space usage without significant computational overhead.

For text-based files, backups, and logs that compress well, **`gzip** or **`zstd\`** can save significant storage space at the cost of slower write speeds.

### System Resources

In systems with limited CPU resources, enabling `gzip-9` can affect overall performance. In such cases, **`lz4`** is preferred to avoid excessive CPU usage.

In systems with ample CPU resources where storage efficiency is more critical, **`gzip-9`** or **`zstd`** can be used for compressing archival or infrequently accessed data.
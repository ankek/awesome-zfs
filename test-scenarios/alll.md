    mdadm (UPD: 13.08.2023, добавлены тесты с закрытием write hole - ppl & log)

    lvm (и надстройка VDO) - (UPD: 13.08.2023 добавлен тест с alloc=anywhere)

    ZFS (UPD: 13.08.2023 добавлены тесты с zpool blocksize = 128k)







MDADM

Создание mdadm достаточно типично:
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=6 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1

Для 5-ого рейда (Перед началом тестов было выждано 3 часа, пока создавался рейд)
mdadm --create --verbose /dev/md5 --level=5 --raid-devices=6 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1


LVM

LVM - для создание используются параметры
lvcreate -i6 -I64 --type striped -l 100%VG -n lvm_stripe stripe
lvcreate -i5 -I64 --type raid5 -l 100%VG -n lvm_raid5 raid


LVM+VDO


Так как на Debian vdo просто нет, даже в виде пакета он добавлялся как модуль к ядру с использованием этого руководства), тесты проводились с включённым дедупом, так как это параметр по умолчанию.
При создании использовались следующие параметры, так как по умолчанию VDO не поддерживает raid конфигурацию, поэтому пул создавался через lvconvert.

lvcreate -i6 -I64 --type striped -l 100%VG -n stripe-vdo lvm
lvconvert --type vdo-pool --virtualsize 8TB /dev/lvm/stripe-vdo

ZFS

После каждой группы тестов сервер перезапускался, т.е., к примеру, после тестов stripe 16k и перед тестами на 8k, чтобы однозначно очистить ARC.
Когда выйдет ZFS 3.0 с патчем O_DIRECT для nvme, я расширю её, сейчас же ZFS выглядит следующим образом:

## блок 16k (новые дефолтные параметры)
компрессия lz4 (не оказывает влияния на IOPS, по множественным заявлениям и по результатом тестов), дедуп выключен:

zpool create -o ashift=12 -O compression=lz4 -O atime=off -O recordsize=16k nvme /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1
zfs create -s -V 10T -o volblocksize=16k -o compression=lz4 nvme/iser

## блок 8к (старые дефолтные параметры)
zpool create -o ashift=12 -O compression=lz4 -O atime=off -O recordsize=8k nvme /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1
zfs create -s -V 10T -o volblocksize=8k -o compression=lz4 nvme/iser

## блок 64к (как просто большой блок)

zpool create -o ashift=12 -O compression=lz4 -O atime=off -O recordsize=64k nvme /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1
zfs create -s -V 10T -o volblocksize=64k -o compression=lz4 nvme/iser


## options
zfs_vdev_async_write_min_active=1024
zfs_vdev_async_write_max_active=2048
zfs_vdev_async_read_min_active=1024
zfs_vdev_async_read_max_active=2048
zfs_vdev_sync_write_min_active=1024
zfs_vdev_sync_write_max_active=2048
zfs_vdev_sync_read_min_active=1024
zfs_vdev_sync_read_max_active=2048
zfs_vdev_queue_depth_pct=100


https://habr.com/ru/companies/vk/articles/770300/

time dd if=/dev/zero of/dev/null bs=1B
time dd if=/dev/zero of/dev/null bs=1024B
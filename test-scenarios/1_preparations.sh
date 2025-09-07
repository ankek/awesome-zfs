#!/bin/bash
# This script
# 1. Creates a temporary directory /scratch to hold test files.
# 2. Makes it fully accessible to all users.
# 3. Generates 12 empty files with size large 3 GB in directory /scratch, which can be used for subsequent testing 
# or experimentation with ZFS (e.g., creating a ZFS pool, testing snapshots, or simulating large disk usage).

sudo mkdir /scratch
sudo chmod 777 /scratch/
for i in {1..12}; do truncate -s 3G /scratch/3g-$i.img; done

zpool create tank draid:4d:1s:11c /scratch/3g-10.img  /scratch/3g-11.img /scratch/3g-12.img /scratch/3g-1.img /scratch/3g-2.img /scratch/3g-3.img /scratch/3g-4.img /scratch/3g-5.img /scratch/3g-6.img /scratch/3g-7.img /scratch/3g-8.img /scratch/3g-9.img

dd if=/dev/zero of=/scratch/3g-1.img bs=4M count=1 2>/dev/null

zpool scrub tank
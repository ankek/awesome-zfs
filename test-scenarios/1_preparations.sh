sudo mkdir /scratch
sudo chmod 777 /scratch/
for i in {1..12}; do truncate -s 3G /scratch/3g-$i.img; done

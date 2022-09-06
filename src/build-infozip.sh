#!/bin/sh
apk update
apk add alpine-sdk

wget https://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz
tar xf zip30.tar.gz
cd zip30
sed -i 's/^LFLAGS1 =/LFLAGS1 =-static/; s/^LFLAGS2 =/LFLAGS2 = -s -static/' unix/Makefile
sed -i '/^prefix =/ c prefix = /root/build/' unix/Makefile
make -f unix/Makefile generic 
make -f unix/Makefile install

wget https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
tar xf unzip60.tar.gz
cd unzip60
sed -i 's/^LF =/LF =-static/; s/^SL =/SL =-static/; s/^FL =/FL =-static/' unix/Makefile
sed -i '/^prefix =/ c prefix = /root/build/' unix/Makefile
make -f unix/Makefile generic
make -f unix/Makefile install
cd ..
cd build/
tar czf ../zip-tools.tar.gz * 
cd ..

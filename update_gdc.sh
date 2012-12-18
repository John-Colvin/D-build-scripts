set -e

git_dir=/home/john/Git
gcc_dir=$git_dir/GDC/gcc_for_gdc

pushd .

#/home/john/update_gcc.sh
sudo rm -rf /home/john/Git/GDC/gcc_for_gdc/*
cp -r /home/john/Git/GDC/gcc_back/* /home/john/Git/GDC/gcc_for_gdc/

cd $git_dir/GDC/dev
git reset --hard
git pull
./setup-gcc.sh $gcc_dir
sudo rm -rf ../objdir
mkdir -p ../objdir
cd ../objdir
$gcc_dir/configure --enable-languages=d --prefix=/opt/gdc --with-bugurl="http://gdcproject.org/bugzilla" --enable-checking=release --enable-lto

#make clean
make -j3 2>&1 | tee build.log

sudo make install

popd

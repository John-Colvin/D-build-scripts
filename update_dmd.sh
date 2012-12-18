set -e

make_flags='-f posix.mak MODEL=64 -j5'
git_dir=~/Git
install_dir=~/Installations/dmd
link_dir=~/Installations/bin

mkdir -p $install_dir/bin $install_dir/lib $install_dir/include

pushd .

cd $git_dir/dmd/src
cd ..
git reset --hard
git pull
cd src
make $make_flags clean
make $make_flags
cp dmd $install_dir/bin

cd $git_dir/druntime
git reset --hard
git pull
make $make_flags clean
make $make_flags
cp lib/*.a $install_dir/lib
cp -r import/* $install_dir/include

cd $git_dir/phobos
git reset --hard
git pull
make $make_flags clean
make $make_flags
cp generated/linux/release/64/*.a $install_dir/lib
cp -r std etc $install_dir/include

cd $git_dir/dtools
git reset --hard
git pull
dmd rdmd.d -O
dmd catdoc.d -O
cp rdmd catdoc $install_dir/bin

popd

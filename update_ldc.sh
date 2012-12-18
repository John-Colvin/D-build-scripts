set -e

git_dir=~/Git

pushd .

cd $git_dir/ldc
git pull
git submodule update --init
mkdir -p build
cd build
cmake .. -DLIB_SUFFIX=64 -DBUILD_SHARED_LIBS=OFF
make -j5
sudo make install VERBOSE=1

popd

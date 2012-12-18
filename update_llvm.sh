set -e

git_dir=~/Git
install_dir=~/Installations/gdc
link_dir=~/Installations/bin

pushd .

cd $git_dir/llvm/llvm
svn revert -R .
svn update
cd $git_dir/llvm/llvm/tools/clang
svn revert -R .
svn update
cd $git_dir/llvm/llvm/projects/compiler-rt
svn revert -R .
svn update
cd $git_dir/llvm/llvm/projects/test-suite
svn revert -R .
svn update

mkdir -p $git_dir/llvm/build
cd $git_dir/llvm/build

../llvm/configure --prefix=/usr --bindir=/usr/bin --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --enable-optimized --enable-assertions

make -j5

sudo make install

popd

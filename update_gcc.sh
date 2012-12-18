set -e

git_dir=/home/john/Git
install_dir=/home/john/Installations/gdc
link_dir=/home/john/Installations/bin

pushd .

cd $git_dir/GDC/gcc_for_gdc
svn revert -R .
svn update

popd

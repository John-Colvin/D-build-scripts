set -e

dc=$1

if [ "$dc" = "" ]; then
	dc=dmd
	install_dir=~/Installations/$dc
else 
	if [ "$dc" = "gdc" ]; then
		dc=gdmd
		install_dir=~/Installations/gdc
	else 
		if [ "$dc" = "ldc2" ]; then
			dc=ldmd2
			install_dir=~/Installations/ldc2
		fi
	fi

fi

git_dir=~/Git

link_dir=~/Installations/bin

pushd .

cd $git_dir/orange
git reset --hard
git pull
make clean
make MODEL=64 DC=$dc -j5
make install PREFIX=$install_dir
rm -r $install_dir/include/orange
mv $install_dir/include/d/* $install_dir/include
rm -r $install_dir/include/d

popd

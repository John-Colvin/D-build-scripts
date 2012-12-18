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

echo Installing to $install_dir

pushd .

cd $git_dir/John-Colvin/D-YAML
rm -f cdc.o cdc 
rm -f libd*
$dc cdc.d
./cdc release
if [ -f "libdyaml" ]; then
	mv libdyaml libdyaml.a
fi
if [ -f "liblibdyaml.a" ]; then
	mv liblibdyaml.a libdyaml.a
fi
cp libdyaml.a $install_dir/lib/
cp -r dyaml $install_dir/include
cp yaml.d $install_dir/include

popd

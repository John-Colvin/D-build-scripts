set -e

git_dir=~/Git
install_dir=~/Installations/dmd
link_dir=~/Installations/bin

pushd .

cd $git_dir/D-YAML
#git reset --hard          currently need to keep all the safe nothrow edits
#git pull
rm cdc.o cdc
dmd cdc.d
./cdc
cp libdyaml.a $install_dir/lib
cp -r dyaml $install_dir/include
cp yaml.d $install_dir/include

popd

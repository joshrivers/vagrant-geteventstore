# apt installation of dependencies for mono
apt-get update
apt-get -q -y install g++ make gettext

# download eventstore
wget -nv http://download.geteventstore.com/binaries/eventstore-mono-v3.0.0rc2.tar.gz
# download mono
wget -nv http://download.mono-project.com/sources/mono/mono-3.4.0.tar.bz2

# compile and install mono
tar -xvjf mono-3.4.0.tar.bz2
cd mono-3.4.0/

# fix for mono-3.4.0 tarball missing file: https://bugzilla.xamarin.com/show_bug.cgi?id=18690
cp /vagrant/Microsoft.Portable.Common.targets mcs/tools/xbuild/targets/Microsoft.Portable.Common.targets 
./configure --prefix=/usr/local; make; make install
cd ..

# unpack eventstore
tar -xvzf eventstore-mono-v3.0.0rc2.tar.gz
cd EventStore-Mono-v3.0.0rc2/
cp /vagrant/singlenode-config.json singlenode-config.json
mono-sgen EventStore.SingleNode.exe &
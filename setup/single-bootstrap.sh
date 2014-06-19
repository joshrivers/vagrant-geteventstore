sudo apt-get update

echo Download Eventstore
wget -nv http://download.geteventstore.com/binaries/eventstore-mono-v3.0.0rc2.tar.gz
echo Download Mono
wget -nv http://download.mono-project.com/sources/mono/mono-3.4.0.tar.bz2

sudo apt-get -q -y install g++ make gettext

tar -xvjf mono-3.4.0.tar.bz2
cd mono-3.4.0/
cat > mcs/tools/xbuild/targets/Microsoft.Portable.Common.targets <<EOL
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Import Project="..\Microsoft.Portable.Core.props" />
    <Import Project="..\Microsoft.Portable.Core.targets" />
</Project>
EOL
./configure --prefix=/usr/local; make; make install
cd ..

tar -xvzf eventstore-mono-v3.0.0rc2.tar.gz

cd EventStore-Mono-v3.0.0rc2/
cp singlenode-config.dist.json singlenode-config.json
cat <<EOF > singlenode-config.json
{ ip: "192.168.50.11"}
EOF
mono-sgen EventStore.SingleNode.exe &

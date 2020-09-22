# install onedrive
sudo apt install libcurl4-openssl-dev libsqlite3-dev build-essential pkg-config
curl -fLo ./dlang.deb http://downloads.dlang.org/releases/2.x/2.093.1/dmd_2.093.1-0_amd64.deb
sudo apt install ./dlang.deb
rm ./dlang.deb -rf
git clone https://github.com/abraunegg/onedrive
cd onedrive && ./configure
make
sudo make install
cd ..
rm onedrive -rf

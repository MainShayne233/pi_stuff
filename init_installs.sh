#!/bin/bash
sudo apt-get update

sudo apt-get install vim git postgresql -y

sudo apt-get install wget -y
sudo apt-get install libssl-dev -y
sudo apt-get install ncurses-dev -y
wget http://www.erlang.org/download/otp_src_19.1.tar.gz
tar -xzvf otp_src_19.1.tar.gz
cd otp_src_19.1/
./configure
make
sudo make install
cd ..
rm otp_src_19.1.tar.gz
sudo rm -R otp_src_19.1/

mkdir /opt
cd /opt
git clone https://github.com/elixir-lang/elixir.git
cd elixir
sudo make
export PATH=$PATH:/opt/elixir/bin
cd

#!/bin/bash

mkdir ~/opt
cd ~/opt
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

git clone https://github.com/elixir-lang/elixir.git
cd elixir
sudo make
cd ..


wget https://nodejs.org/dist/v4.6.1/node-v4.6.1-linux-armv7l.tar.gz

tar -xzf node-v4.6.1-linux-armv7l.tar.gz

rm node-v4.6.1-linux-armv7l.tar.gz

mv node-v4.6.1-linux-armv7l nodejs

sudo echo PATH=$PATH:/home/pi/opt/elixir/bin:/home/pi/opt/nodejs/bin > /etc/profile.d/opt_to_path.sh

source /etc/profile

mix local.hex --force

mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

mix loxal.rebar --force

sudo -u postgres psql

\password postgres

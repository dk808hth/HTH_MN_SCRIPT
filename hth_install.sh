#!/usr/bin/env bash

COIN_NAME='HTH' #no spaces

#wallet information
WALLET_DOWNLOAD='https://github.com/HTHcoin/HTH/releases/download/v1.2/linux.zip'
WALLET_TAR_FILE='linux.zip'
ZIPTAR='unzip' #can be either unzip or tar -xfzg
EXTRACT_DIR='' #not always necessary, can be blank if zip/tar file has no subdirectories
CONFIG_FOLDER='/root/.hth'
CONFIG_FILE='hth.conf'
COIN_DAEMON='hthd'
COIN_CLI='hth-cli'
COIN_PATH='/usr/bin'
ADDNODE1='140.82.32.139'
ADDNODE2='80.211.42.72'
ADDNODE3='77.81.229.126'
ADDNODE4='138.68.1.181'
ADDNODE5='138.68.156.199'
ADDNODE6='167.99.190.68'
ADDNODE7='167.99.46.23'
ADDNODE8='198.23.197.230'
ADDNODE9='199.247.27.143'
ADDNODE10='209.250.251.94'
ADDNODE11='209.250.231.109'
ADDNODE12='23.94.173.10'
ADDNODE13='45.77.152.231'
ADDNODE14='64.140.150.153'
ADDNODE15='77.81.229.126'
ADDNODE16='95.179.146.98'
ADDNODE17='107.191.46.208'
ADDNODE18='50.109.118.34'
ADDNODE19='80.7.86.121'
ADDNODE20='167.99.217.206'
ADDNODE21='104.196.16.148'
ADDNODE22='83.243.128.13'
ADDNODE23='94.158.93.121'
ADDNODE24='167.99.190.68'
ADDNODE25='138.68.1.181'
ADDNODE26='206.189.98.150'
ADDNODE27='167.99.217.206'
ADDNODE28='167.99.190.68'
ADDNODE29='138.68.1.181'
ADDNODE30='138.68.156.199'
ADDNODE31='206.189.98.150'
ADDNODE32='167.99.217.206'
ADDNODE33='167.99.190.68'
ADDNODE34='138.68.1.181'
ADDNODE35='138.68.156.199'
ADDNODE36='206.189.98.150'
ADDNODE37='104.196.16.148'
ADDNODE38='169.1.11.215'
ADDNODE39='83.243.128.13'
ADDNODE40='83.146.113.6\n'
PORT='35888'
RPCPORT='9215'

BOOTSTRAP='https://www.dropbox.com/s/raw/41hob0jceuqzifj/hth-bootstrap.zip'
BOOTSTRAP_ZIP='hth-bootstrap.zip'


#end of required details
#
#
#

echo "=================================================================="
echo "$COIN_NAME MN DEPENDECIES INSTALLER"
echo "=================================================================="
echo "Installing packages and updates..."
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install curl -y
sudo apt-get install nano -y
sudo apt-get install pwgen -y
sudo apt-get install ufw -y
sudo apt-get install dnsutils -y
sudo apt-get install build-essential libtool autotools-dev pkg-config libssl-dev -y
sudo apt-get install  libc6-dev m4 g++-multilib -y
sudo apt-get install autoconf libtool ncurses-dev unzip git python -y
sudo apt-get install zlib1g-dev wget bsdmainutils automake -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libevent-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install autoconf -y
sudo apt-get install automake -y
sudo apt-get install unzip -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 -y
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev -y
sudo apt-get install libqrencode-dev bsdmainutils -y
echo "Packages complete..."

WANIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
PASSWORD=`pwgen -1 20 -n`
if [ "x$PASSWORD" = "x" ]; then
    PASSWORD=${WANIP}-`date +%s`
fi

#begin downloading wallet
echo "Killing and removing all old instances of $COIN_NAME and Downloading new wallet..."
sudo killall $COIN_DAEMON > /dev/null 2>&1
cd /usr/bin && sudo rm $COIN_CLI $COIN_DAEMON > /dev/null 2>&1 && sleep 2 && cd

rm -rf $EXTRACT_DIR
rm -rf $WALLET_TAR_FILE
wget -U Mozilla/5.0 $WALLET_DOWNLOAD

$ZIPTAR $WALLET_TAR_FILE
cd $EXTRACT_DIR
sudo chmod +x $COIN_CLI $COIN_DAEMON
cp $COIN_CLI $COIN_DAEMON $COIN_PATH
sudo chmod +× /usr/bin/hth*
cd
rm -rf $EXTRACT_DIR
rm -rf $WALLET_TAR_FILE
#end downloading/cleaning up wallet

wget -U Mozilla/5.0 $BOOTSTRAP
sudo mkdir $CONFIG_FOLDER
unzip $BOOTSTRAP_ZIP -d $CONFIG_FOLDER
rm -rf $BOOTSTRAP_ZIP

echo "Creating Conf File wallet"
sudo touch $CONFIG_FOLDER/$CONFIG_FILE
cat <<EOF > $CONFIG_FOLDER/$CONFIG_FILE
rpcuser=$COIN_NAME
rpcpassword=$PASSWORD
rpcallowip=127.0.0.1
server=1
daemon=1
listen=1
rpcport=$RPCPORT
port=$PORT
externalip=$WANIP
addnode=$ADDNODE1
addnode=$ADDNODE2
addnode=$ADDNODE3
addnode=$ADDNODE4
addnode=$ADDNODE5
addnode=$ADDNODE6
addnode=$ADDNODE7
addnode=$ADDNODE8
addnode=$ADDNODE9
addnode=$ADDNODE10
addnode=$ADDNODE11
addnode=$ADDNODE12
addnode=$ADDNODE13
addnode=$ADDNODE14
addnode=$ADDNODE15
addnode=$ADDNODE16
addnode=$ADDNODE17
addnode=$ADDNODE18
addnode=$ADDNODE19
addnode=$ADDNODE20
addnode=$ADDNODE21
addnode=$ADDNODE22
addnode=$ADDNODE23
addnode=$ADDNODE24
addnode=$ADDNODE25
addnode=$ADDNODE26
addnode=$ADDNODE27
addnode=$ADDNODE28
addnode=$ADDNODE29
addnode=$ADDNODE30
addnode=$ADDNODE31
addnode=$ADDNODE32
addnode=$ADDNODE33
addnode=$ADDNODE34
addnode=$ADDNODE35
addnode=$ADDNODE36
addnode=$ADDNODE37
addnode=$ADDNODE38
addnode=$ADDNODE39
addnode=$ADDNODE40
txindex=1
maxconnections=256
EOF

echo "Creating system service file...."
 cat << EOF > /etc/systemd/system/$COIN_NAME.service
[Unit]
Description=$COIN_NAME service
After=network.target
[Service]
User=root
Group=root
Type=forking
#PIDFile=$CONFIG_FOLDER/$COIN_NAME.pid
ExecStart=$COIN_PATH/$COIN_DAEMON -daemon -conf=$CONFIG_FOLDER/$CONFIG_FILE -datadir=$CONFIG_FOLDER
ExecStop=-$COIN_PATH/$COIN_CLI -conf=$CONFIG_FOLDER/$CONFIG_FILE -datadir=$CONFIG_FOLDER stop
Restart=always
PrivateTmp=true
TimeoutStopSec=60s
TimeoutStartSec=10s
StartLimitInterval=120s
StartLimitBurst=5
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
sleep 3
systemctl start $COIN_NAME.service
systemctl enable $COIN_NAME.service >/dev/null 2>&1

echo "Systemctl Complete...."

echo "If you see *error* message, do not worry we are killing wallet again to make sure its dead"
echo ""
echo "=================================================================="
echo "DO NOT CLOSE THIS WINDOW OR TRY TO FINISH THIS PROCESS "
echo "PLEASE WAIT 2 MINUTES UNTIL YOU SEE THE RELOADING WALLET MESSAGE"
echo "=================================================================="
echo ""

echo "Stopping daemon again and creating final config..."

echo "Configuring firewall..."
#add a firewall
sudo ufw allow $PORT/tcp
sudo ufw allow $RPCPORT/tcp
echo "Basic security completed..."

echo "Restarting $COIN_NAME wallet with new configs, 30 seconds..."
sudo chmod +x /usr/bin/hth*
$COIN_DAEMON -daemon
sleep 60

echo "Making genkey..."
GENKEY=$($COIN_CLI masternode genkey)

echo "Mining info..."
$COIN_CLI getmininginfo
$COIN_CLI stop

echo "Stopping daemon again and creating final config..."
cat <<EOF > $CONFIG_FOLDER/$CONFIG_FILE
rpcuser=$COIN_NAME
rpcpassword=$PASSWORD
rpcallowip=127.0.0.1
server=1
daemon=1
listen=1
rpcport=$RPCPORT
port=$PORT
externalip=$WANIP
masternode=1
masternodeprivkey=$GENKEY
addnode=$ADDNODE1
addnode=$ADDNODE2
addnode=$ADDNODE3
addnode=$ADDNODE4
addnode=$ADDNODE5
addnode=$ADDNODE6
addnode=$ADDNODE7
addnode=$ADDNODE8
addnode=$ADDNODE9
addnode=$ADDNODE10
addnode=$ADDNODE11
addnode=$ADDNODE12
addnode=$ADDNODE13
addnode=$ADDNODE14
addnode=$ADDNODE15
addnode=$ADDNODE16
addnode=$ADDNODE17
addnode=$ADDNODE18
addnode=$ADDNODE19
addnode=$ADDNODE20
addnode=$ADDNODE21
addnode=$ADDNODE22
addnode=$ADDNODE23
addnode=$ADDNODE24
addnode=$ADDNODE25
addnode=$ADDNODE26
addnode=$ADDNODE27
addnode=$ADDNODE28
addnode=$ADDNODE29
addnode=$ADDNODE30
addnode=$ADDNODE31
addnode=$ADDNODE32
addnode=$ADDNODE33
addnode=$ADDNODE34
addnode=$ADDNODE35
addnode=$ADDNODE36
addnode=$ADDNODE37
addnode=$ADDNODE38
addnode=$ADDNODE39
addnode=$ADDNODE40
txindex=1
maxconnections=256
EOF

sleep 30

echo "Starting your HTH NODE with final details"

$COIN_DAEMON -daemon

echo "============================================================================="
echo "COPY THIS TO LOCAL WALLET CONFIG FILE AND REPLACE TxID and OUTPUT"
echo "WITH THE DETAILS FROM YOUR COLLATERAL TRANSACTION"
echo "MN1 $WANIP:$PORT $GENKEY TxID OUTPUT"
"============================================================================="
sleep 1

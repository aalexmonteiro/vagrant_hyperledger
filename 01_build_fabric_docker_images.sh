#!/bin/bash

 

# Exit on first error
set -e

echo "Downloading the Fabric Samples and utilities"
git clone -b master https://github.com/hyperledger/fabric-samples.git
cd fabric-samples
git checkout v1.4.3
curl -sSL http://bit.ly/2ysbOFE | bash -s 1.4.3

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Setting bin of utilities into PATH
echo 'export PATH='$DIR'/bin:$PATH' >> ~/.profile

echo "Pulling the Hyperledger Images"

echo echo "Pulling the Fabric Peer"
docker pull hyperledger/fabric-peer:1.4.3

echo echo "Pulling the Fabric Orderer"
docker pull hyperledger/fabric-orderer:1.4.3

echo echo "Pulling the Fabric CCEnv"
docker pull hyperledger/fabric-ccenv:1.4.3

echo echo "Pulling the Fabric CouchDB"
docker pull hyperledger/fabric-couchdb:0.4

echo echo "Pulling the Fabric JavaEnv"
docker pull hyperledger/fabric-javaenv:1.4.3

echo echo "Pulling the Fabric CA"
docker pull hyperledger/fabric-ca:1.4.3

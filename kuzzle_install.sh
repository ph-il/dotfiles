#!/bin/bash

# Install Kuzzle

# Create the Kuzzle root directory
if ! [ -d "${PRJ_DEV}/Kuzzle" ] 
then
	cd "${PRJ_DIR}"
    mkdir -pv Kuzzle
fi;

# Create a directory for Kuzzle Proxy and install it
cd "${PRJ_DIR}/Kuzzle"
git clone https://github.com/kuzzleio/kuzzle-proxy.git
cd kuzzle-proxy
git checkout rc.x
npm install

# Create a directory for Kuzzle Core and install it
cd "${PRJ_DIR}/Kuzzle"
git clone https://github.com/kuzzleio/kuzzle.git
cd kuzzle
git checkout rc.x
git submodule init
git submodule update
npm install

WORKING_DIR=$(pwd)
PLUGINS_DIR=plugins/enabled

# npm install plugins
for plugin in $WORKING_DIR/$PLUGINS_DIR/*
do
  if [ -d $plugin ]
  then
    echo 'Installing dependencies for plugin' $(basename $plugin)
    cd $plugin
    npm install
  fi
done

cd $WORKING_DIR

echo "apps:
   - name: kuzzle-proxy
     cwd: ${KUZZLE_PROXY_INSTALL_DIR}
     script: ${KUZZLE_PROXY_INSTALL_DIR}/index.js
   - name: kuzzle
     cwd: ${KUZZLE_CORE_INSTALL_DIR}
     script: ${KUZZLE_CORE_INSTALL_DIR}/bin/kuzzle
     args: start
     env:
       kuzzle_server__http__port: 7510
       kuzzle_services__proxyBroker__host: localhost
  " > ${KUZZLE_DIR}/pm2.conf.yml

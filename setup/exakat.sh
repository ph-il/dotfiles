#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

# Creation Exakat Directory
if ! [ -d "${PRJ_DIR}/tools/exakat" ]
then
    cd "${PRJ_DIR}"
    mkdir -p tools/exakat
fi;

cd "${PRJ_DIR}/tools/exakat"

curl -o exakat.phar 'https://www.exakat.io/versions/index.php?file=latest'
curl -o apache-tinkerpop-gremlin-server-3.4.7-bin.zip 'https://www.exakat.io/versions/apache-tinkerpop-gremlin-server-3.4.7-bin.zip'
unzip apache-tinkerpop-gremlin-server-3.4.7-bin.zip
mv apache-tinkerpop-gremlin-server-3.4.7 tinkergraph
rm -rf apache-tinkerpop-gremlin-server-3.4.7-bin.zip

# Optional : install neo4j engine.
cd tinkergraph
./bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin 3.4.7
cd ..

php exakat.phar doctor

cd "${PRJ_DIR}/dotfiles"

#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

# Creation Exakat Directory
if ! [ -d "${PRJ_DIR}/tools/exakat" ]
then
    cd "${PRJ_DIR}"
    mkdir -p tools/exakat
fi;

cd "${PRJ_DIR}/tools/exakat"

curl -o exakat.phar http://dist.exakat.io/index.php?file=latest
curl -o apache-tinkerpop-gremlin-server-3.3.3-bin.zip http://dist.exakat.io/apache-tinkerpop-gremlin-server-3.3.3-bin.zip
unzip apache-tinkerpop-gremlin-server-3.3.3-bin.zip
mv apache-tinkerpop-gremlin-server-3.3.3 tinkergraph
rm -rf apache-tinkerpop-gremlin-server-3.3.3-bin.zip

# Optional : install neo4j engine.
rm -r ~/.groovy/grapes/
rm -r ~/.m2/
cd tinkergraph
./bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.3.3
cd ..


php exakat.phar doctor

sudo sed -i -e "s/;php73        = \/path\/to\/php73/php73 = \/usr\/local\/opt\/php73\/bin\/php/g" config/exakat.ini


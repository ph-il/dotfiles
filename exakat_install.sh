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
curl -o apache-tinkerpop-gremlin-server-3.2.6-bin.zip http://ftp.tudelft.nl/apache/tinkerpop/3.2.6/apache-tinkerpop-gremlin-server-3.2.6-bin.zip
unzip apache-tinkerpop-gremlin-server-3.2.6-bin.zip
mv apache-tinkerpop-gremlin-server-3.2.6 tinkergraph
rm -rf apache-tinkerpop-gremlin-server-3.2.6-bin.zip

# Optional : install neo4j engine.
cd tinkergraph
#bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin 3.2.6
bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.6
cd ..

php exakat.phar doctor
#sudo sed -i -e "s/;php70        = \/path\/to\/php70/php70 = \/usr\/local\/opt\/php70\/bin\/php/g" config/exakat.ini
#sudo sed -i -e "s/;php71        = \/path\/to\/php71/php71 = \/usr\/local\/opt\/php71\/bin\/php/g" config/exakat.ini

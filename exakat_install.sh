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

#sudo sed -i -e "s/;php56        = \/path\/to\/php56/php56 = \/usr\/local\/opt\/php56\/bin\/php/g" config/exakat.ini
#sudo sed -i -e "s/;php70        = \/path\/to\/php70/php70 = \/usr\/local\/opt\/php70\/bin\/php/g" config/exakat.ini
#sudo sed -i -e "s/;php71        = \/path\/to\/php71/php71 = \/usr\/local\/opt\/php71\/bin\/php/g" config/exakat.ini
sudo sed -i -e "s/;php72        = \/path\/to\/php72/php72 = \/usr\/local\/opt\/php72\/bin\/php/g" config/exakat.ini

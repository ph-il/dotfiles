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
curl -O http://neo4j.com/artifact.php?name=neo4j-community-2.3.5-unix.tar.gz
tar -xf artifact.php\?name=neo4j-community-2.3.5-unix.tar.gz
mv neo4j-community-2.3.5 neo4j
rm -rf artifact.php\?name=neo4j-community-2.3.5-unix.tar.gz
neostart
neostop
echo 'org.neo4j.server.thirdparty_jaxrs_classes=com.thinkaurelius.neo4j.plugins=/tp' >> $NEO4J_HOME/conf/neo4j-server.properties
git clone https://github.com/thinkaurelius/neo4j-gremlin-plugin.git gremlin-plugin
cd gremlin-plugin
sudo sed -i -e 's/2.3.1/2.3.5/g' pom.xml
sudo sed -i -e 's/2.3.1/2.3.5/g' tinkerpop2/pom.xml
sudo sed -i -e 's/2.3.1/2.3.5/g' tinkerpop3/pom.xml
sudo sed -i -e 's/3.1.0-incubating/3.2.0-incubating/g' tinkerpop3/pom.xml
mvn clean package -Dtp.version=3
unzip target/neo4j-gremlin-plugin-tp3-2.3.5-server-plugin.zip -d $NEO4J_HOME/plugins/gremlin-plugin
sudo sed -i -e 's/dbms.security.auth_enabled=true/dbms.security.auth_enabled=false/g' neo4j/conf/neo4j-server.properties
cd "${PRJ_DIR}/tools/exakat"
rm -rf gremlin-plugin
chmod 777 neo4j
neostart
exakat doctor
sudo sed -i -e "s/;php55        = \/path\/to\/php55/php55 = \/usr\/local\/opt\/php55\/bin\/php/g" config/exakat.ini
sudo sed -i -e "s/;php56        = \/path\/to\/php56/php56 = \/usr\/local\/opt\/php56\/bin\/php/g" config/exakat.ini
sudo sed -i -e "s/;php70        = \/path\/to\/php70/php70 = \/usr\/local\/opt\/php70\/bin\/php/g" config/exakat.ini

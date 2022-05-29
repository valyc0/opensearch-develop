cp ./OpenSearch-Dashboards/config/opensearch_dashboards.yml_ori ./OpenSearch-Dashboards/config/opensearch_dashboards.yml

#START
# start opensearch db:
docker run -d -p 9200:9200 -p 9600:9600 --name os-node1 -e "discovery.type=single-node" opensearchproject/opensearch:1.2.0

git clone https://github.com/opensearch-project/OpenSearch-Dashboards.git

cd OpenSearch-Dashboards
git checkout 1.1.0

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
nvm install 10.24.1

nvm use
npm i -g yarn


echo "opensearch.hosts: ["https://localhost:9200"]
opensearch.username: "admin" # Default username on the docker image
opensearch.password: "admin" # Default password on the docker image
opensearch.ssl.verificationMode: none


server.host: "0.0.0.0"
opensearch.ignoreVersionMismatch: true" >> ./config/opensearch_dashboards.yml




yarn osd bootstrap # This command will also install npm dependencies


yarn start --run-examples



#START
# start opensearch db:
docker start os-node1

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
nvm install 10.24.1

nvm use
npm i -g yarn

cd OpenSearch-Dashboards/

yarn osd bootstrap # This command will also install npm dependencies

yarn start --run-examples

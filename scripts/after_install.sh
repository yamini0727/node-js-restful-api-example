#!/bin/bash
set -x
chown -R ubuntu:ubuntu /home/ubuntu/nodejs/

echo  "***Installing npm package ***" >> /tmp/nodejs-api-prod_deploy_logs
echo >> /tmp/nodejs-api-prod_deploys_logs
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm install'
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm install --unsafe-perm'
#runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm run build'
sleep 10
echo "***starting nodejs-api-prod application ***" >> /tmp/nodejs-api-prod_deploy_logs
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs &&  npm start  ' >> /tmp/nodejs-api-prod_deploy_logs

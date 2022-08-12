#!/bin/bash
set -x
chown -R ubuntu:ubuntu /home/ubuntu/nodejs/

echo  "***Installing npm package ***" >> /tmp/nodejs-api-prod_deploy_logs
echo >> /tmp/nodejs-api-prod_deploys_logs
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm install'
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm install --unsafe-perm'
#runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && npm run build'
sleep 10
echo "***starting nodejs-api-prod_deploy_logs application ***" >> /tmp/nodejs-api-prod_deploy_logs
runuser -l ubuntu -c 'cd /home/ubuntu/nodejs && sudo pm2 start server/server.js --name nodejs-backend0  --silent' >> /tmp/nodejs-api-prod_deploy_logs

s1=`pm2 status | grep -we nodejs-backend0 | awk '{print $12}'`
sleep 3
s2=`pm2 status | grep -we nodejs-backend0 | awk '{print $12}'`
if [ $s1 == $s2 ]
then
echo "BUILD SUCCESSFUL" >> /tmp/nodejs-api-prod_deploy_logs
echo >> nodejs-api-prod_deploy_logs
else
echo "Node process is restarting" >> /tmp/nodejs-api-prod_deploy_logs
echo >> /tmp/nodejs-api-prod_deploy_logs
fi

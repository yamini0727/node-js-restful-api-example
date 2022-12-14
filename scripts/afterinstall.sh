#!/bin/bash
set -x
chown -R ec2-user:ec2-user /home/ec2-user/eb-backend/

echo  "***Installing npm package ***" >> /tmp/eb-backend-api-prod_deploy_logs
echo >> /tmp/eb-backend-api-prod_deploys_logs
runuser -l ec2-user -c 'cd /home/ec2-user/eb-backend && npm install'
runuser -l ec2-user -c 'cd /home/ec2-user/eb-backend && npm install --unsafe-perm'
runuser -l ec2-user -c 'cd /home/ec2-user/eb-backend && npm run build'
runuser -l ec2-user -c 'cd /home/ec2-user/eb-backend && npm start'
then
echo "BUILD SUCCESSFUL" >> /tmp/getty-backend-api-prod_deploy_logs
echo >> /tmp/getty-backend-api-prod_deploy_logs
else
echo "Node process is restarting" >> /tmp/getty-backend-api-prod_deploy_logs
echo >> /tmp/getty-backend-api-prod_deploy_logs

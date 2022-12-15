#!/bin/bash
set -x
chown -R ec2-user:ec2-user /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend

echo  "***Installing npm package ***" >> /tmp/eb-backend-api-prod_deploy_logs
echo >> /tmp/eb-backend-api-prod_deploys_logs
runuser -l ec2-user -c 'cd /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend && npm install'
runuser -l ec2-user -c 'cd /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend && npm install --unsafe-perm'
runuser -l ec2-user -c 'cd /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend && npm run build'
runuser -l ec2-user -c 'cd /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend && npm start'
then
echo "BUILD SUCCESSFUL" >> /tmp/eb-backend-api-prod_deploy_logs
echo >> /tmp/eb-backend-api-prod_deploy_logs
else
echo "Node process is restarting" >> /tmp/eb-backend-api-prod_deploy_logs
echo >> /tmp/eb-backend-api-prod_deploy_logs

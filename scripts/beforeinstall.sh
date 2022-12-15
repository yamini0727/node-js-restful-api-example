#!/bin/bash
set -x
echo "** eb-backend-chat-api-prod process status **" >> /tmp/eb-backend-chat-api-prod_deploy_logs

rm -rf /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend

if [ ! -d /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend ]; then
runuser -l ec2-user -c 'mkdir -p /opt/elasticbeanstalk/hooks/appdeploy/pre/eb-backend' >> /tmp/eb-backend-chat-prod_deploy_logs
fi

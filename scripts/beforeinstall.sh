#!/bin/bash
set -x
echo "** eb-backend-chat-api-prod process status **" >> /tmp/eb-backend-chat-api-prod_deploy_logs

rm -rf /home/ec2-user/eb-backend

if [ ! -d /home/ec2-user/eb-backend-chat ]; then
runuser -l ec2-user -c 'mkdir -p /home/ec2-user/eb-backend' >> /tmp/eb-backend-chat-prod_deploy_logs
fi

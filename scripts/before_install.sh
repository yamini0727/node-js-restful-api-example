#!/bin/bash
set -x
echo "** nodejs-api-prod process status **" >> /tmp/nodejs-api-prod_deploy_logs

rm -rf /home/ubuntu/nodejs

if [ ! -d /home/ubuntu/nodejs ]; then
runuser -l ubuntu -c 'mkdir -p /home/ubuntu/nodejs' >> /tmp/nodejs-prod_deploy_logs
fi

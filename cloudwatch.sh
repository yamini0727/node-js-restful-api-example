#!/bin/bash
yum install amazon-cloudwatch-agent -y
filename="config.json"
echo "{ 

        "agent": { 

                "metrics_collection_interval": 60, 

                "run_as_user": "root" 

        }, 

        "metrics": { 

                "append_dimensions": { 

                        "AutoScalingGroupName": "${aws:AutoScalingGroupName}", 

                        "ImageId": "${aws:ImageId}", 

                        "InstanceId": "${aws:InstanceId}", 

                        "InstanceType": "${aws:InstanceType}" 

                }, 

                "metrics_collected": { 

                        "mem": { 

                                "measurement": [ 

                    { 

                        "name": "mem_available_percent", 

                        "rename": "app_mem_available_percent" 

                    }, 

                    { 

                        "name": "mem_used_percent", 

                        "rename": "app_mem_used_percent" 

                    } 

                                ], 

                                "metrics_collection_interval": 60 

                        } 

                } 

        } 

}  " >> $filename
mv config.json /opt/aws/amazon-cloudwatch-agent/bin/
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

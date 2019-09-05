#!/bin/sh
export INSECURE=0 # Make this 0 if hub.juniper.net is used
export TAG=1909.13 # Use the appropriate tag for contrail-command
export CONTRAIL_VERSION=1909.13
export COMMAND_SERVER_IP=10.204.216.120 #THIS IS nodea4
# The below two if hub.juniper.net is used
export CONTAINER_REGISTRY_USERNAME=JNPR-Customer200
export CONTAINER_REGISTRY_PASSWORD=FSg0vLW^7oM#GZy8Ju*f

export VIRTUAL_SETUP=1 # Make this 0 if nodeg12 setup is used

export COMMAND_SERVERS_FILE=/root/k8s_contrail_command_deployment/command_servers.yml

if [ $VIRTUAL_SETUP -eq 1 ]
then 
    export INSTANCES_FILE=/root/k8s_contrail_command_deployment/instances_virtual.yml
else
    # Change this to instances_mgmt.yml if management ip needs to be used
    export INSTANCES_FILE=/root/k8s_contrail_command_deployment/instances.yml 
fi
# Set both below as 0 when No Action is required
export PROVISION=1
export IMPORT=0
echo "INSECURE=$INSECURE, TAG=$TAG, COMMAND_SERVER_IP=$COMMAND_SERVER_IP, PROVISION=$PROVISION, IMPORT=$IMPORT, C_FILE=$COMMAND_SERVERS_FILE, I_FILE=$INSTANCES_FILE"
echo "Ensure modified instances.yml and unchanged command_servers.yml file from nodem4 are there in the Contrail-command server"
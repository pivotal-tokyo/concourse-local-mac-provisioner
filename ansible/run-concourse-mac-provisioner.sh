#!/bin/bash

CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND="/usr/local/bin/ansible-playbook -v -i $1, -K -e 'ansible_python_interpreter=/usr/local/bin/python3'"

if [ $1 == "localhost" ]
then
    ANSIBLE_FLAG_LOCALHOST=" -c local"

    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_LOCALHOST
else
    ANSIBLE_FLAG_SSH=" -k"
    ANSIBLE_FLAG_USERNAME=" -u pivotal"

    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_SSH
    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_USERNAME
fi

CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=" concourse-playbook.yml"

$CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND
#!/bin/bash

USER=rhel

su - $USER -c 'cat > /home/rhel/playbook.yml << EOF
---
- name: snmp ro/rw string configuration
  hosts: cisco
  gather_facts: no
  tasks:
    - name: ensure that the desired snmp strings are present
      cisco.ios.config:
        commands:
          - snmp-server community ansible-public RO
          - snmp-server community ansible-private RW

EOF
cat /home/rhel/playbook.yml'

su - rhel -c 'ansible-navigator run  /home/rhel/playbook.yml --mode stdout'

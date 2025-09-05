#!/bin/bash

tee /tmp/setup-scriptssolve_challenege_2.yml << EOF

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
          - snmp-server community ansible-test RO

EOF
sudo chown rhel:rhel /tmp/setup-scriptssolve_challenege_2.yml
su - rhel -c 'ansible-navigator run  /tmp/setup-scriptssolve_challenege_2.yml --mode stdout'

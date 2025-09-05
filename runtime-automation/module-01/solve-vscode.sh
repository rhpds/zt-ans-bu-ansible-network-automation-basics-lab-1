#!/bin/bash

tee /tmp/setup-scripts/solve_challenege_1.yml << EOF

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
sudo chown rhel:rhel /tmp/setup-scripts/solve_challenege_1.yml
su - rhel -c 'ansible-navigator run  /tmp/setup-scripts/solve_challenege_1.yml --mode stdout'

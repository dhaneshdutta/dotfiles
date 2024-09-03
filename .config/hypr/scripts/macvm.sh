#!/bin/bash
# start the VM
virsh --connect qemu:///system start "catalina"
# connect to the VM
virt-manager --connect qemu:///system --show-domain-console "catalina"


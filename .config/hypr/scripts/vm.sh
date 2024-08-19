#!/bin/bash
# start the VM
virsh --connect qemu:///system start "win11"
# connect to the VM
virt-manager --connect qemu:///system --show-domain-console "win11"

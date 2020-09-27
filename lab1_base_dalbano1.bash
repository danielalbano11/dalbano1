#!/bin/bash

#This is Daniel Albano's SPR500 Baseline Script for Lab 1

#hostname
echo "Hostname: "
echo ""
cat /etc/hostname
echo ""
echo ""

#disk/partition size, usage, and mount points
echo "Disk/partition size, usage and mount points: "
echo ""
df -h
echo ""
echo""

#network devices (name) found from https://superuser.com/questions/203272/list-only-the-device-names-of-all-available-network-interfaces
echo "Network devices: "
echo ""
ifconfig -a | sed 's/[ \t].*//;/^$/d'
echo""
echo""


#IP address, broadcast, and netmask for each active devices
echo "IP address, broadcast, and netmask for each active device: "
echo ""
ifconfig -a
echo ""
echo ""

#OS version.release level, kernel version used
echo "OS version/release level, kernel version used: "
echo ""
cat /etc/os-release
echo ""
echo ""
#Security Mode (SELinux status)
echo "Security Mode (SELinux Status): "
echo ""
sestatus | grep "SELinux status"
echo ""
echo ""

#Firewall Configuration
echo "Firewall configuration: "
echo ""
firewall-cmd --list-all
echo ""
echo ""

#list of active repositories
echo "List of active repositories: "
echo ""
yum repolist
echo ""
echo ""

#Number of software packages installed
echo "Number of software packages installed: "
echo ""
yum list installed | wc -l

#Name of software packages installed
echo "Name of software packages installed: "
echo ""
yum list installed
echo ""
echo ""


#DNS server configured
echo "DNS server configured: "
echo ""
cat /etc/resolv.conf
echo ""
echo ""

#list of active shell users
echo "List of active shell users: "
echo ""
cat /etc/passwd | grep home
echo ""
echo ""

#date the OS was first installed
echo "Date the OS was first installed: "
echo ""
rpm -qi basesystem | grep "Install Date"
echo ""
echo ""


#hardware details
echo "Hardware details: "
echo ""
echo "CPU Details"
lscpu
echo ""
echo "Memory"
free
echo""
echo "PCI Devices"
lspci
echo ""
echo "USB Devices"
lsusb
echo ""
echo ""

#services currently running
echo "Services currently running: "
echo ""
systemctl --type=service --state=active
echo ""
echo ""

#services installed but not running
echo "Services installed but not running: "
echo ""
systemctl --type=service --state=inactive


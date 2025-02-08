#!/bin/bash

####################################################################
###                                                            #####
### Name: server-stats.sh                                      #####
### About: It can analyse the basic server performance stats   #####
### like CPU usage, RAM, version and Disk etc                  #####
###                                                            #####
####################################################################

# About CPU
echo "CPU Deatails:";
lscpu | grep -E 'Socket|Core|Thread|CPU';
echo;
echo;

# Total usage of CPU
echo "Total usage of CPU:"
top -b -n 1 | grep "Cpu"
echo;
top -b -n 1 | grep "Cpu" | awk '{print "User CPU:", $2, "System CPU:", $4, "Idle:", $8}'
echo;

# Memory usage
echo "Total Memory usage:"
free -th
echo;

# Disk Usage
echo "Disk usage details:"
df -hT
echo;

# Top 5 processes by CPU usage
echo "Top 5 processes by CPU usage:"
top -b -n 1 | head -12 | tail -5
echo;

#Top 5 processes by memory usage
echo "Top 5 processes by memory usage:"
top -b -o +%MEM | head -12 | tail -6
echo;

#OS version and Kernel version
echo "OS version:";
cat /etc/os-release |grep -E "VERSION";
echo "Kernel version:"
uname -a | awk '{print $3}';
echo;

echo "Server uptime:"
uptime
echo;

echo "Users who are logged in:"
who


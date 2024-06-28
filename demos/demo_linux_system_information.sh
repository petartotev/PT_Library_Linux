#!/bin/bash

# Script name: system_info_dashboard.sh
# Description: A script to display a comprehensive system information dashboard.

# Function to display system uptime
display_uptime() {
    echo "=== System Uptime ==="
    uptime
    echo
}

# Function to display CPU usage
display_cpu_usage() {
    echo "=== CPU Usage ==="
    mpstat | awk '/all/ {printf "User: %.1f%%, System: %.1f%%, Idle: %.1f%%\n", $3, $5, $12}'
    echo
}

# Function to display memory usage
display_memory_usage() {
    echo "=== Memory Usage ==="
    free -h | awk 'NR==2{printf "Total: %s, Used: %s, Free: %s\n", $2, $3, $4}'
    echo
}

# Function to display disk usage
display_disk_usage() {
    echo "=== Disk Usage ==="
    df -h | awk '$NF=="/"{printf "Filesystem: %s, Size: %s, Used: %s, Available: %s, Use%%: %s\n", $1, $2, $3, $4, $5}'
    echo
}

# Function to display network statistics
display_network_statistics() {
    echo "=== Network Statistics ==="
    ip -s link show | awk '/^[0-9]/ {print "Interface: " $2} /RX:/ {print "Received: " $3 " bytes"} /TX:/ {print "Transmitted: " $3 " bytes"}'
    echo
}

# Function to display logged-in users
display_logged_in_users() {
    echo "=== Logged-In Users ==="
    who
    echo
}

# Function to display top processes
display_top_processes() {
    echo "=== Top Processes ==="
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10
    echo
}

# Display the dashboard
clear
echo "================================="
echo "      System Information         "
echo "================================="
display_uptime
display_cpu_usage
display_memory_usage
display_disk_usage
display_network_statistics
display_logged_in_users
display_top_processes
echo "================================="
echo "      End of Dashboard           "
echo "================================="

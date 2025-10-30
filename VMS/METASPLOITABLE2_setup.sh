#!/bin/bash
# This script serves primarily as a configuration documentation file for the Metasploitable2 VM.

### Hardware Configuration Table
# The lines below are designed to be a readable table within the script.
# | Machines          | CPU | RAM | STORGE |
# |-------------------|-----|-----|--------|
# | METASPLOITABLE2   | 1   | 512mb | 8GB    |

###  VM Setup Documentation
# Use comments (#) to document the key information about this VM.

# **Purpose:** Intentionally vulnerable Linux VM for penetration testing practice.

# **Default Username:** msfadmin
# **Default Password:** msfadmin

# **Known Vulnerabilities:**
# FTP, SSH, Telnet, Samba, VNC, PostgreSQL, MySQL default credentials/weak configurations,
# and common web application flaws like SQL injection and command injection.

# **Network Configuration:**
# **NETWORK_MODE="NAT"**
# **STATIC_IP="192.168.1.10"** # Replace with the actual IP you assign in your lab
# **SUBNET_MASK="255.255.255.0"**

# **Post-Setup Reminders:**
# **- Ensure the VM is isolated on a dedicated, non-Internet-facing network.**
# **- Only use this VM for authorized, ethical hacking practice.**

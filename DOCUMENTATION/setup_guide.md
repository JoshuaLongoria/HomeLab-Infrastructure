# HomeLab Setup & Troubleshooting Guide

This guide details the specific configurations and common "gotchas" encountered while building the Virtual HomeLab.

---

## 1. VirtualBox Network Configuration
To allow VMs to communicate while remaining isolated from your physical home network, use a **NAT Network**.

1. Go to **File > Tools > Network Manager**.
2. Create a new NAT Network named `LabNetwork` or any name you perfer.
3. Set the IPv4 Prefix to `10.0.2.0/24`.
4. Ensure "Enable DHCP" is checked (or handle static IPs manually as shown below).

---
## 2. Checking IP address on Kail Linux
ifconfig
## 3. Checking IP address on Ubuntu
1. Install ifconfig if not found
2. sudo apt update && sudo apt install net-tools -y
# Check IP address
1. ifconfig
## 4. Check if Kail Linux can connect to Metaspolitable2 through IP
Ping Metasploitable2 (4 times)
1. ping -c 4 10.0.2.4
## 5. Metasploitable2 Configuration

### Fix: Disk Image Not Found (VBOX_E_OBJECT_NOT_FOUND)
If you see an error stating the `.vmdk` file cannot be opened:
1. Go to **File > Virtual Media Manager**.
2. Locate the `Metasploitable.vmdk` with the ⚠️ warning icon.
3. Click **Remove** (choose "Keep" so the file isn't deleted).
4. Go back to the VM **Storage** settings and re-add the hard disk by browsing to its current location on your drive.

### Setting a Static IP
Metasploitable2 uses an older version of Ubuntu. To set a static IP:
1. Run `sudo nano /etc/network/interfaces`.
2. Modify the `eth0` section:
   ```text
   auto eth0
   iface eth0 inet static
       address 10.0.2.4
       netmask 255.255.255.0
       gateway 10.0.2.1

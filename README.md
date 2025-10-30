# HomeLab-Infrastructure

# Overview: 
  This home lab is simuulated network enviroment running on Oracle VM VirtualBox.
  It hosts two virtual machines
  | Machines                                       | Purpose        | Connected |
|-----------------------------------------------|----------------------------|----------|
| Kali Linux                                    |for penetration testing practice| NAT Network|
| Ubuntu Server          | for general administrastion and services| NAT Network |
| METASPLOITABLE2        | To test vulnerabilities| NAT Network | 
      
# System Specs:
   | Machines                                   | CPU                         | RAM |  STORGE |
|-----------------------------------------------|----------------------------|---------|-------|
| Windows 10 pro (HOST)                                | Intel core i9 - 7900X | 64 GB DDR4| 2TB|
| Kali Linux          | 2 | 4000mb  |25GB
| Ubuntu Server       | 4 | 8000mb  |25GB
| METASPLOITABLE2     | 1 | 512mb   |8GB

# Networking Table: 
| Machines   | Opertating system| Adapter Type| Network Mode|Mac address| IP address|Purpose|
|------------|------------------|-------------|-------------|-----------|-----------|------|
|VM1           |Kali Linux | intel Pro | NAT network| 0800270D1B72 | 10.0.2.3 | Pentesting security tools|
|VM2       | Ubuntu | intel Pro | NAT network|0800272B2EED | 10.0.2.15 | Web server testing services|
|VM3       | METASPLOITABLE2 | intel Pro | NAT Network| 080027133BAF | 192.168.1.3 | vulnerability Testing| 

### Getting started:
This section outlines the immediate steps required to power on you Virtual Machines (VMs),
configure their network for optiaml lab use, and ensure they are ready for penetration testing and 
service administration.

#### 1. Configure the VirutalBox NAT Network 
The VMs will use a shared, private "Nat Network" to communicate directly with each other while sharing the host machine's internet connection.

1. **Create the Network:**
   * In the VirtualBox main application menu on the Host PC: On side taskbar there should be a tab named **Network** -> **Nat Networks** 
   * Click **"Create New Nat Network"** and accept the default settings
2. **Assign to VMs:**
   * Go to **Settings** -> **Network** -> **Adapter 1** 
   * Change **Attached to:** from "Nat" to the **NAT Network** you just created
   
#### 2. Power On and Verify Connectivity
1. **Start VMs:** Power on both the **Kali Linux** and **Ununtu Server** VMs.
2. **Check IPs:** They will automatically recevice unique IP addresses from the NAT Network.
   Use the following command inside each VM to verify the connection:
   * `ip a`
3. **Update Table:** Record the new, unique IP addresses for both VMs in the **Network Tabel** above.
4. **Test Communication:** From the **Kali VM**, run ` ping [Ubuntu Server IP]` to confirm direct communication

#### 3. Initial Setup and Hardening
1. **Update Kali:** Keep sercuity tools current by running: 
```bash
sudo eapt update && sudo apt full-upgrade -y
```
2. **Harden Ubuntu (UFW):** Enable the Uncomplicated Firewall (UFW) on the Ubuntu Server:
```bash
# Deny all incoming connections by default 
sudo ufw default deny incoming
# Allow necessary services (e.g., SHH on port 22)
sudo ufw allow ssh
# Enable the firewall 
sudo ufw enable
```

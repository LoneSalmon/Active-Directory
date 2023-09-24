<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1d10a0e9-e2f0-46bf-b80a-f9f7beae8423"> 
</p>

<h1 align="center"> Microsoft Server Module (MCSA) </h1>
<h2 align="center"> Server Management in Active-Directory </h2>
<h4 align="center"> Student Name: Mustafa Jaber | Class: CSPP83 | Lecturer: Binyamin Cohen | 24/09/2023 </h4>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/74f5fabb-cf76-47aa-9595-1892ea1d66bb" height="600px" width="800"> 
</p>

## Introduction
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a meticulously designed network infrastructure, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, Group Policies, user management, security protocols, organizational efficiency, remote access solutions, and comprehensive documentation. This project underscores my expertise in Microsoft technologies and network security principles, emphasizing the pivotal role of a well-structured directory service in modern network management.

## Table of Contents
### [1. Introduction](https://github.com/LoneSalmon/Active-Directory/edit/main/README.md#introduction)
### [2. Requirements for the lab environment](https://github.com/LoneSalmon/Active-Directory/edit/main/README.md#requirements-for-the-lab-environment)
### [3. Setting up the lab environment](https://github.com/LoneSalmon/Active-Directory/edit/main/README.md#setting-up-the-lab-environment)
### [4. Creating & Configuring a Domain Controller](https://github.com/LoneSalmon/Active-Directory/edit/main/README.md#creating--configuring-a-domain-controller)

## Requirements for the lab environment
### [1. Vmware Workstation Pro](https://www.vmware.com/il/products/workstation-pro.html)
### [2. Windows Server 2019 VM's (3 Machines)](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
### [3. Windows 10/11 Pro VM's (2 Machines)](https://www.microsoft.com/en-us/software-download/windows10)

## Setting up the lab environment
<p align="center"> <strong>--- I will not be diving deep into setting-up virtual machines in Vmware since this is out of the scope of this project ---</strong> </p>
<p align="center"> <a href="https://medium.com/r3d-buck3t/building-an-active-directory-lab-part-1-windows-server-2022-setup-7dfaf0dafd5c"><strong>You can check this link here for a guide</strong></a> </p>

- We will start by setting up the lab environment in 5 virtual machines in Vmware Workstation Pro. It will Consist of 2 Domain Controllers and a routing server (PAT) (3 Windows Server 2019 OS's) and 2 end-user clients hosting Windows 10 Pro.

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1b75a183-6995-4452-b7c7-5117b5f41397"> 
</p>

- It is important to make sure that each virtual machine is configured to NAT and that you have NAT already configured in your Vmware Workstation Pro settings **(Note that I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active-Directory services)**
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/2934cd0e-cfd6-4deb-9dba-d01bca4b51f7" height="600px" width="800"> 
</p>

- Once that's done, begin installing the Operating System individually and then we will do some basic settings up for both DC's and SRV-1 (basic networking settings)
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/422963d5-e98f-4838-9ef9-280c27aebd01"> 
</p>

- Change NIC configuration to match your (Future) domain network by selecting the "Ethernet0" value > going to NIC properties > Selecting "Internet Protocol Version 4 (TCP/IPv4)" > Select "Use the following IP address" and "Use the following DNS server addresses" > Add the corrosponding Network address according to the previous "NAT" network that was added by Vmware
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93090491-1fae-493a-81fa-e950a937e063"> 
</p>
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73aa5a6f-aa5d-4c49-9685-023a2e3f1f50"> 
</p>
<p align="center"> <strong>-- Note that the reason that "Host" portion of the IP address is "3" and not "1" or "2" for example is because these two "Host" addresses are reserved for Vmwares' NAT operation - "1" is for the NAT bridge that was installed on the host machine and "2" is for the virtual switch (Default-Gateway). <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">Here's more details on the subject</a> --</strong> </p>

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller)
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6de8c76d-f18b-4222-8664-2a300fd4eba2"> 
</p>
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/15435f3c-c888-4883-83b4-79b0683bf5ea"> 
</p>

- Restart, and repeat the same steps in DC2 and SRV1 with their corrosponding names and using the IP addresses with "4" and "5" as the hosts.

## Creating & Configuring a Domain Controller
- The first step to creating a domain, is to create a Domain-Controller (DC for short). For that we will go to the Server Manager Application > Click on Manage at the top right and then add Roles and Features

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8e599590-dae1-4425-bf71-75ba35a959e2"> 
</p>

- We will go through the setup wizard to add the needed roles

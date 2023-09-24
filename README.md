<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1d10a0e9-e2f0-46bf-b80a-f9f7beae8423"> 
</p>

<h1 align="center"> Microsoft Server Module (MCSA) </h1>
<h2 align="center"> Server Management in Active-Directory </h2>
<h4 align="center"> Student Name: <a href="https://www.linkedin.com/in/mustafa-jaber-5a143b269/">Mustafa Jaber</a> | <a href="https://see-security.com/?lang=en">See-Security College, Ramat-Gan</a> | Class: CSPP83 | Lecturer: Binyamin Cohen | 24/09/2023 </h4>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/74f5fabb-cf76-47aa-9595-1892ea1d66bb" height="600px" width="800"> 
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Table of Contents </h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#-introduction-"> ➤ Introduction</a></li>
    <li><a href="#-requirements-for-the-lab-environment-"> ➤ Requirements for the lab environment</a></li>
    

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 id="Introduction" align="center"> Introduction </h2>

<p align="justify">
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a meticulously designed network infrastructure, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, Group Policies, user management, security protocols, organizational efficiency, remote access solutions, and comprehensive documentation. This project underscores my expertise in Microsoft technologies and network security principles, emphasizing the pivotal role of a well-structured directory service in modern network management.
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 id="Requirements-for-the-lab-environment" align="center"> Requirements for the lab environment </h2>

1. [Vmware Workstation Pro](https://www.vmware.com/il/products/workstation-pro.html)
2. [Windows Server 2019 VM's (3 Machines)](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
3. [Windows 10/11 Pro VM's (2 Machines)](https://www.microsoft.com/en-us/software-download/windows10)

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 id="Setting-up-the-lab-environment" align="center"> Setting up the lab environment </h2>.

<p align="center"> 
  <strong>I will not be diving deep into Vmware since this is out of the scope of this project</strong> 
</p>
<p align="center"> 
  <a href="https://medium.com/r3d-buck3t/building-an-active-directory-lab-part-1-windows-server-2022-setup-7dfaf0dafd5c">
    <em>You can check this link here for a guide</em></a> 
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- We will start by setting up the lab environment in 5 virtual machines in Vmware Workstation Pro. It will Consist of 2 Domain Controllers, a routing server (PAT) (3 Windows Server 2019 OS's), and two end-user clients hosting Windows 10 Pro.<br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1b75a183-6995-4452-b7c7-5117b5f41397"> 
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- It is essential to make sure that each virtual machine is configured to NAT and that you have NAT already configured in your Vmware Workstation Pro settings.<br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/2934cd0e-cfd6-4deb-9dba-d01bca4b51f7" height="600px" width="800"><br> 
  <em>Note that I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active-Directory services</em>
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- Once that's done, begin installing the Operating System individually, and then we will do some basic settings up for both DCs and SRV-1 (basic networking settings).<br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/422963d5-e98f-4838-9ef9-280c27aebd01"> 
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- Change NIC configuration to match your (Future) domain network as follows:
  * Select "Ethernet0" Value →<br>
  * Go To NIC properties →<br>
  * Open "Internet Protocol Version 4 (TCP/IPv4)" →<br>
  * Check "Use the following IP address"→<br> 
  * Check "Use the following DNS server addresses" →<br> 
  * Add the corresponding Network address according to the previous "NAT" network that was added by VMWare<br>
  
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93090491-1fae-493a-81fa-e950a937e063"> 
</p>
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73aa5a6f-aa5d-4c49-9685-023a2e3f1f50"> 
</p>

*Note that the reason that the "Host" portion of the IP address is "3" and not "1" or "2" for example, is because these two "Host" addresses are reserved for Vmwares' NAT operation:*  <br>
*- "1" is for the NAT bridge that was installed on the host machine.*  <br>
*- "2" is for the virtual switch (Default-Gateway).*  <br>

  <p align="center">
    <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">
      <em>Here's more details on the subject</em></a>
  </p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller)
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6de8c76d-f18b-4222-8664-2a300fd4eba2"> 
</p>
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/15435f3c-c888-4883-83b4-79b0683bf5ea"> 
</p>
<p align="center"> 
  <em>Restart, repeat the same steps in DC2 and SRV1 with their corresponding names, and use the IP addresses with "4" and "5" as the hosts.</em>
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 id="Creating-and-configuring-a-domain-controller" align="center"> Creating & Configuring a Domain Controller </h2>

- The first step to creating a domain is to create a Domain-Controller (DC for short). For that, we will go to the Server Manager Application > Click on Manage at the top right and then add Roles and Features

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8e599590-dae1-4425-bf71-75ba35a959e2"> 
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- We will go through the setup wizard to add the needed roles (I skipped the first page by default since it's not necessary)<br>
- In the installation wizard, we must choose between "Role-based or feature-based installation" and "Remote Desktop Services installation".<br>
- To install a Domain-Controller, select "Role-based or feature-based installation."

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/695d96c2-1261-4f11-a66e-98f7e5ed5844"> 
</p>

<p align="center"> <strong>What is the difference?</strong></p>
<p align="justify"> 
  Role-based or feature-based installation configures the server's core roles and optional features to provide fundamental services in your network environment. Remote Desktop Services installation, on the other hand, is specifically focused on enabling remote desktop access and application delivery for multiple users. In an Active Directory environment, you might use role-based or feature-based installation to set up essential services like Domain Controllers, DNS, and DHCP. Afterward, if you need to provide remote desktop access to users, you would install the Remote Desktop Services role separately to cater to that specific requirement.
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- The next step is to select the server from the server pool. Here, I will choose my current server, "DC1-Mustafa".

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8b8c7d4e-2b3b-4d4a-8d66-9e813319f485"> 
</p>

<p align="center">
  <em>We cannot see "DC2" and "SRV1" even though they're in the same subnet because we haven't created a domain yet</em>
</p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>

- In the "Server Roles" page, we will select the following roles for DC1 and add all of their features:<br>
  * "Active Directory Domain Services"
  * "DHCP Server" - We will need it to give out IP information for our clients on the domain.
  * "DNS Server" - We will configure this as our primary DNS for the domain.
  * The already (partially) selected "File and Storage Services"

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/d72a0466-2816-4858-8ee4-6afdfaedf62c"> 
</p>

- We will skip the "Features" page since we already selected all the features for the corresponding Server Roles we added.
- We will also skip all the "About" pages on each Server Role we added.

--------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
- Then we will reach the "Confirmation" page and hit "Install"

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73f73bbb-db05-4d83-b3e5-d85466c0e539">  <br>
  <em>We will not need to check the "Restart..." box since this is a local Server</em>
</p>

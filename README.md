<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1d10a0e9-e2f0-46bf-b80a-f9f7beae8423"> 
</p>

<h1 align="center"> Microsoft Server Module (MCSA) </h1>
<h2 align="center"> Server Management in Active-Directory </h2>
<h4 align="center"> Student Name: <a href="https://www.linkedin.com/in/mustafa-jaber-5a143b269/">Mustafa Jaber</a> | <a href="https://see-security.com/?lang=en">See-Security College, Ramat-Gan</a> | Class: CSPP83 | Lecturer: Binyamin Cohen | 10/10/2023 </h4>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/74f5fabb-cf76-47aa-9595-1892ea1d66bb" height="400px" width="auto"> 
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Table of Contents </h2>

  <ol>
    <li><a href="#-introduction-"> Introduction</a></li>
    <li><a href="#-requirements-for-the-lab-environment-"> Requirements for the lab environment</a></li>
    <li><a href="#-setting-up-the-lab-environment-"> Setting up the lab environment</a></li>
    <li><details open="open">
      <summary><a href="#-creating--configuring-a-domain-controller-"> Creating & Configuring a Domain Controller</a></summary>
      <ol>
        <li><a href="#-creating-server-roles-"> <em> Creating Server Roles</em></a></li>
        <li><a href="#-configuring-our-1st-domain-controller-"> <em> Configuring our 1st Domain Controller</em></a></li>
      </ol>
    </details></li>
  </ol>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Introduction </h2>

<p align="justify">
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a meticulously designed network infrastructure, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, Group Policies, user management, security protocols, organizational efficiency, remote access solutions, and comprehensive documentation. This project underscores my expertise in Microsoft technologies and network security principles, emphasizing the pivotal role of a well-structured directory service in modern network management.
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Requirements for the lab environment </h2>

1. [Vmware Workstation Pro](https://www.vmware.com/il/products/workstation-pro.html)
2. [Windows Server 2019 VM's (3 Machines)](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
3. [Windows 10/11 Pro VM's (2 Machines)](https://www.microsoft.com/en-us/software-download/windows10)

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Setting up the lab environment </h2>.

<p align="center"> 
  <strong>I will not be diving deep into Vmware since this is out of the scope of this project</strong>  <br>
  <a href="https://medium.com/r3d-buck3t/building-an-active-directory-lab-part-1-windows-server-2022-setup-7dfaf0dafd5c">
    <em>You can check this link here for a guide</em></a> 
</p>

___

- We will start by setting up the lab environment in 5 virtual machines in Vmware Workstation Pro. It will Consist of 2 Domain Controllers, a routing server (PAT) (3 Windows Server 2019 OS's), and two end-user clients hosting Windows 10 Pro.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1b75a183-6995-4452-b7c7-5117b5f41397"> 
</p>

___

- It is essential to make sure that each virtual machine is configured to NAT and that you have NAT already configured in your Vmware Workstation Pro settings.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/2934cd0e-cfd6-4deb-9dba-d01bca4b51f7" height="600px" width="800">  <br> 
  <em>Note that I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active-Directory services</em>
</p>

___

- Once that's done, begin installing the Operating System individually, and then we will do some basic settings up for both DCs and SRV-1 (basic networking settings).  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/422963d5-e98f-4838-9ef9-280c27aebd01"> 
</p>

___

- Change NIC configuration to match your (Future) domain network as follows:  <br>
  * Select "Ethernet0" Value →  <br>
  * Go To NIC properties →  <br>
  * Open "Internet Protocol Version 4 (TCP/IPv4)" →  <br>
  * Check "Use the following IP address"→  <br> 
  * Check "Use the following DNS server addresses" →  <br> 
  * Add the corresponding Network address according to the previous "NAT" network that was added by VMWare  <br>
  
<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93090491-1fae-493a-81fa-e950a937e063" height="auto" width="500">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73aa5a6f-aa5d-4c49-9685-023a2e3f1f50" height="auto" width="500">
</p>

*Note that the reason that the "Host" portion of the IP address is "3" and not "1" or "2" for example, is because these two "Host" addresses are reserved for Vmwares' NAT operation:*  <br>
- *"1" is for the NAT bridge that was installed on the host machine.*  <br>
- *"2" is for the virtual switch (Default-Gateway).*  <br>

  <p align="center">
    <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">
      <em>Here's more details on the subject</em></a>
  </p>

___

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller)  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6de8c76d-f18b-4222-8664-2a300fd4eba2">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/15435f3c-c888-4883-83b4-79b0683bf5ea">  <br>
  <em>Restart, repeat the same steps in DC2 and SRV1 with their corresponding names and use the IP addresses with "4" and "5" as the hosts.</em>
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> Creating & Configuring a Domain Controller </h2>
<h3> Creating Server Roles </h3>

- The first step to creating a domain is to create a Domain-Controller (DC for short). For that, we will go to the Server Manager Application > Click on Manage at the top right and then add Roles and Features  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8e599590-dae1-4425-bf71-75ba35a959e2"> 
</p>

___

- We will go through the setup wizard to add the needed roles (I skipped the first page by default since it's not necessary)  <br>
- In the installation wizard, we must choose between "Role-based or feature-based installation" and "Remote Desktop Services installation".  <br>
- To install a Domain-Controller, select "Role-based or feature-based installation."  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/695d96c2-1261-4f11-a66e-98f7e5ed5844">  <br>
  <strong>What is the difference?</strong>
</p>

<p align="justify"> 
  <em>Role-based or feature-based installation configures the server's core roles and optional features to provide fundamental services in your network environment. Remote Desktop Services installation, on the other hand, is specifically focused on enabling remote desktop access and application delivery for multiple users. In an Active Directory environment, you might use role-based or feature-based installation to set up essential services like Domain Controllers, DNS, and DHCP. Afterward, if you need to provide remote desktop access to users, you would install the Remote Desktop Services role separately to cater to that specific requirement.</em>
</p>

___

- The next step is to select the server from the server pool. Here, I will choose my current server, "DC1-Mustafa".  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8b8c7d4e-2b3b-4d4a-8d66-9e813319f485">  <br>
  <em>We cannot see "DC2" and "SRV1" even though they're in the same subnet because we haven't created a domain yet</em>
</p>

___

- In the "Server Roles" page, we will select the following roles for DC1 and add all of their features:  <br>
  * "Active Directory Domain Services"  <br>
  * "DHCP Server" - We will need it to give out IP information for our clients on the domain.  <br>
  * "DNS Server" - We will configure this as our primary DNS for the domain.  <br>
  * The already (partially) selected "File and Storage Services"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/d72a0466-2816-4858-8ee4-6afdfaedf62c"> 
</p>

- We will skip the "Features" page since we already selected all the features for the corresponding Server Roles we added.  <br>
- We will also skip all the "About" pages on each Server Role we added.

___

- Then we will reach the "Confirmation" page and hit "Install"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73f73bbb-db05-4d83-b3e5-d85466c0e539">  <br>
  <em>We will not need to check the "Restart..." box since this is a local Server</em>
</p>

- Once the wizard is done installing, you are given the option to "Promote this server to a domain controller":  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ed2c0dbd-7c23-4563-9934-a60dcbe99d67">  <br>
  <em>This will lead us to the next section.</em>
</p>

- Note that if you reached this point and hit "Close" instead of "Promote this server to a domain controller" then there's no need to panic and follow these steps:  <br>
  * On the top right of the Server Manager UI, you will see a flag with ⚠️ on it.  <br>
  * When clicking on it, you will see the tasks that need to be completed, among them is Promoting the server.  <br>
  * You can click on the task to resume the configuration.  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/46b3a110-117e-4193-a738-9ead89e9ffb0">
</p>

___

<h3> Configuring our 1st Domain Controller </h3>
- For a first deployment, we will need to select the "Add a new forest" operation.  <br>
- Then specify the "Root Domain Name", in my case, it will be "mustafa.com".  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/55d86627-2b51-498a-82ca-e575b2f586b1">  <br>
    <strong>Why Did I select "Add a new forest"?</strong>  <br>
    <p align="justify">
      <em> Selecting "Add a new forest" when deploying a domain controller for the first time is necessary when establishing a new Active Directory environment from scratch. It allows you to create the foundation for your directory structure, set forest-wide settings, and maintain administrative autonomy over your network.</em></p>
</p>

___

- For the DC options, we will need to select the following settings:  <br>
  * Forest & Domain Functional level: Since we will be using the same OS on all servers, the latest.  <br>
  * We will need to ✔️ the DNS since we will require it for configuring a DNS on this DC.  <br>
  * We will also ✔️ the Global Catalog, since we need it for replication between DC1 to DC2. Follow this <a href="https://learn.microsoft.com/en-us/windows/win32/ad/global-catalog">link</a> to understand GC functionality.  <br>
  * We <strong>do not</strong> select "RODC", this is reserved for DC's that we dont to have it's info changed/tampered with.  <br>
  * We are required to enter a DSRM password for catastrophes, check this <a href="https://en.wikipedia.org/wiki/Directory_Services_Restore_Mode">link</a> for more info.<br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/49fd7589-2a98-41e3-9f96-f9900baf89fa">
  </p>

___

- I will be skipping the DNS options since we will not be covering DNS delegation in this step.  <br>
- In the additional Options page, the NetBIOS domain name will be automatically generated from the root domain name we specified earlier. <a href="http://www.differencebetween.net/technology/internet/difference-between-dns-and-netbios/">Here's more info on NetBIOS</a>.  <br>
- In the "Paths" page, we can see and edit the default folders for:  <br>
  * Database: NTDS is a critical component of the Active Directory infrastructure, housing the database files that store directory information.  <br>
  * Log files: Log files associated with AD database contains transaction logs that record all changes made to the database.  <br>
  * SYSVOL: Responsible for storing and distributing Group Policy objects and other system-level settings (Scripts for example) across all domain controllers.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/f0232555-f698-49c6-9caf-b36340d2ebbd">
</p>

___

- Lastly, we will reach the "Review Options" page, where we can review all the configurations we did. Take note of the following sentence:  <br>
<p align="center">
  <strong>The password of the new domain Administrator will be the same as the password of the local Administrator of this computer.</strong>
</p>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6f66ee18-14e3-4e66-bd69-b084bcecb25c">  <br>
  <em>If you haven't yet configured a local Admin password when installing the VM, you will run into this error in the Prerequisites Check page</em>
</p>

- The way to remedy this is to change (or create) a local admin password using <a href="https://www.top-password.com/knowledge/change-windows-10-password.html">any of these simple methods here</a>.
- Once the password is updated we hit the "Rerun prerequisites check" link and can see that there are no errors:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6c11826b-ceab-4efb-9a6b-7b305bca8799">  <br>
  <em>Please make sure that the password you created is for the Adminstrator profile and not your current user profile</em>
</p>

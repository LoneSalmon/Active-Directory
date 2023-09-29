<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1d10a0e9-e2f0-46bf-b80a-f9f7beae8423"> 
</p>

<h1 align="center"> Microsoft Server Module (MCSA) </h1>
<h2 align="center"> ⚰️ Server Management in Active-Directory ⚰️ </h2>
<h4 align="center"> Student Name: <a href="https://www.linkedin.com/in/mustafa-jaber-5a143b269/">Mustafa Jaber</a> | <a href="https://see-security.com/?lang=en">See-Security College, Ramat-Gan</a> | Class: CSPP83 | Lecturer: Binyamin Cohen | 10/10/2023 </h4>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/74f5fabb-cf76-47aa-9595-1892ea1d66bb" height="400px" width="auto"> 
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 📑 Table of Contents 📑</h2>

  <ol>
    <li><a href="#--introduction--"> Introduction</a></li>
    <li><a href="#--requirements-for-the-lab-environment--"> Requirements for the lab environment</a></li>
    <li><a href="#-%EF%B8%8F-setting-up-the-lab-environment-%EF%B8%8F-"> Setting up the lab environment</a></li>
    <li><details open="open">
      <summary><a href="#--creating--configuring-a-domain-controller--"> Creating & Configuring a Domain Controller</a></summary>
      <ol>
        <li><a href="#--creating-server-roles-"> <em> Creating Server Roles</em></a></li>
        <li><a href="#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-"> <em> Configuring our 1st Domain Controller</em></a></li>
        <li><a href="#-initial-security-step-"> <em> Intial Security Step</em></a></li>
        <li><a href="#-adding-a-secondary-domain-controller-dc2"> <em> Adding a Secondary Domain Controller (DC2)</em></a></li>
        <li><a href="#-configure-dc2-as-the-rid-master-"> <em> Configure DC2 as the RID Master</em></a></li>
      </ol>
    </details></li>
    <li><details open="open">
      <summary><a href="#-%EF%B8%8F-active-directoy-user--computers-management-%EF%B8%8F-"> Active Directory Users & Computers Management</a></summary>
      <ol>
        <li><a href="#-the-aduc-gui-"> <em> The ADUC GUI</em></a></li>
        <li><a href="#creating-ous-users--groups-using-the-gui"> <em> Creating OUs, Users & Groups Using the GUI</em></a></li>
      </ol>
    </details></li>
  </ol>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 🚪 Introduction 🚪 </h2>

<p align="justify">
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a meticulously designed network infrastructure, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, Group Policies, user management, security protocols, organizational efficiency, remote access solutions, and comprehensive documentation. This project underscores my expertise in Microsoft technologies and network security principles, emphasizing the pivotal role of a well-structured directory service in modern network management.
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 🧰 Requirements for the lab environment 🧰 </h2>

1. [Vmware Workstation Pro](https://www.vmware.com/il/products/workstation-pro.html)
2. [Windows Server 2019 VM's (3 Machines)](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
3. [Windows 10/11 Pro VM's (2 Machines)](https://www.microsoft.com/en-us/software-download/windows10)

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 🏗️ Setting up the lab environment 🏗️ </h2>

<p align="center"> 
  <strong>I will not be diving deep into Vmware since this is out of the scope of this project</strong>  <br>
  <a href="https://medium.com/r3d-buck3t/building-an-active-directory-lab-part-1-windows-server-2022-setup-7dfaf0dafd5c">
    👉 <em>You can check this link here for a guide</em></a> 👈
</p>

___

- We will start by setting up the lab environment in 5 virtual machines in Vmware Workstation Pro. It will Consist of 2 Domain Controllers, a routing server (PAT) (3 Windows Server 2019 OS's), and two end-user clients hosting Windows 10 Pro.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1b75a183-6995-4452-b7c7-5117b5f41397"> 
</p>

___

- It is essential to ensure that each virtual machine is configured to NAT and that you have NAT already configured in your Vmware Workstation Pro settings.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/2934cd0e-cfd6-4deb-9dba-d01bca4b51f7" height="500px" width="auto">  <br> 
  <em>❗ Note that I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active-Directory services ❗</em>
</p>

___

- Once that's done, begin installing the Operating System individually, and then we will do some basic setting up for both DCs and SRV-1 (basic networking settings).  <br>

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
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93090491-1fae-493a-81fa-e950a937e063" height="auto" width="500px">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/73aa5a6f-aa5d-4c49-9685-023a2e3f1f50" height="auto" width="500px">
</p>

❗ *Note that the reason that the "Host" portion of the IP address is "3" and not "1" or "2" for example is because these two "Host" addresses are reserved for Vmwares' NAT operation:* ❗  <br>
- *"1" is for the NAT bridge installed on the host machine.*  <br>
- *"2" is for the virtual switch (Default-Gateway).*  <br>

  <p align="center">
    <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">
      <em>👉 Here's more details on the subject 👈</em></a>
  </p>

___

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller)  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6de8c76d-f18b-4222-8664-2a300fd4eba2" height="auto" width="500px">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/15435f3c-c888-4883-83b4-79b0683bf5ea" height="auto" width="500px">  <br>
  ❗ <em>Restart, repeat the same steps in DC2 and SRV1 with their corresponding names and use the IP addresses with "4" and "5" as the hosts.</em> ❗
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 🤔 Creating & Configuring a Domain Controller 🤔 </h2>

<p align="center">
  <em>In this section of the project, we will be exploring the steps needed to create Two domain controllers properly (I will explain the rationale during setup) and talk briefly about the features and options that will come across during setup.</em>
</p>  <br>

<strong>Here are the topic that we're going to cover:</strong>  <br>
<ol>
  <li><a href="#--creating-server-roles-"> <em> Creating Server Roles</em></a></li>
  <li><a href="#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-"> <em> Configuring our 1st Domain Controller</em></a></li>
  <li><a href="#-initial-security-step-"> <em> Intial Security Step</em></a></li>
  <li><a href="#-adding-a-secondary-domain-controller-dc2"> <em> Adding a Secondary Domain Controller (DC2)</em></a></li>
  <li><a href="#-configure-dc2-as-the-rid-master-"> <em> Configure DC2 as the RID Master</em></a></li>
</ol>

___

<h3> 🧻 Creating Server Roles 🧻</h3>

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
  <strong>😨 What is the difference? 😨</strong>
</p>

<p align="justify"> 
  <em>Role-based or feature-based installation configures the server's core roles and optional features to provide fundamental services in your network environment. Remote Desktop Services installation, on the other hand, is specifically focused on enabling remote desktop access and application delivery for multiple users. In an Active Directory environment, you might use role-based or feature-based installation to set up essential services like Domain Controllers, DNS, and DHCP. Afterward, if you need to provide remote desktop access to users, you would install the Remote Desktop Services role separately to cater to that specific requirement.</em>
</p>

___

- The next step is to select the server from the server pool. Here, I will choose my current server, "DC1-Mustafa".  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8b8c7d4e-2b3b-4d4a-8d66-9e813319f485">  <br>
  ❗ <em>We cannot see "DC2" and "SRV1" even though they're in the same subnet because we haven't created a domain yet</em> ❗
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
  ❗ <em>We will not need to check the "Restart..." box since this is a local Server</em> ❗
</p>

- Once the wizard is done installing, you are given the option to "Promote this server to a domain controller":  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ed2c0dbd-7c23-4563-9934-a60dcbe99d67">  <br>
  ❗ <em>This will lead us to the next section.</em> ❗
</p>

___

- Note that if you reach this point and hit "Close" instead of "Promote this server to a domain controller", then there's no need to panic and follow these steps:  <br>
  * On the top right of the Server Manager UI, you will see a flag with ⚠️ on it.  <br>
  * When clicking on it, you will see the tasks that must be completed. Among them is Promoting the server.  <br>
  * You can click on the task to resume the configuration.  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/46b3a110-117e-4193-a738-9ead89e9ffb0">
</p>

___

<h3> ☣️ Configuring our 1st Domain Controller ☣️ </h3>
- We must select the "Add a new forest" operation for the first deployment.  <br>
- Then specify the "Root Domain Name". In my case, it will be "mustafa.com".  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/55d86627-2b51-498a-82ca-e575b2f586b1">  <br>
    <strong>😨 Why Did I select "Add a new forest"? 😨</strong>  <br>
    <p align="justify">
      <em> Selecting "Add a new forest" when deploying a domain controller for the first time is necessary when establishing a new Active Directory environment from scratch. It allows you to create the foundation for your directory structure, set forest-wide settings, and maintain administrative autonomy over your network.</em></p>
</p>

___

- For the DC options, we will need to select the following settings:  <br>
  * Forest & Domain Functional level: Since we will use the same OS on all servers, the latest.  <br>
  * We will need to ✔️ the DNS since we will require it for configuring a DNS on this DC.  <br>
  * We will also ✔️ the Global Catalog since we need it to replicate DC1 and DC2. Follow this <a href="https://learn.microsoft.com/en-us/windows/win32/ad/global-catalog">link</a> to understand GC functionality.  <br>
  * We <strong>do not</strong> select "RODC". This is reserved for DCs that we don't want its info changed/tampered with.  <br>
  * We are required to enter a DSRM password for catastrophes. Check this <a href="https://en.wikipedia.org/wiki/Directory_Services_Restore_Mode">link</a> for more info.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/49fd7589-2a98-41e3-9f96-f9900baf89fa">
  </p>

___

- I will skip the DNS options since we will not cover DNS delegation in this step.  <br>
- In the Additional Options page, the NetBIOS domain name will be automatically generated from the root domain name we specified earlier. <a href="http://www.differencebetween.net/technology/internet/difference-between-dns-and-netbios/">Here's more info on NetBIOS</a>.  <br>
- In the "Paths" page, we can see and edit the default folders for:  <br>
  * Database: NTDS is a critical component of the Active Directory infrastructure, housing the database files that store directory information.  <br>
  * Log files: Log files associated with AD database contain transaction logs that record all changes made to the database.  <br>
  * SYSVOL: Responsible for storing and distributing Group Policy objects and other system-level settings (Scripts, for example) across all domain controllers.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/f0232555-f698-49c6-9caf-b36340d2ebbd">
</p>

___

- Lastly, we will reach the "Review Options" page, where we can review all the configurations we did. Take note of the following sentence:  <br>
<p align="center">
  <strong>❗ The password of the new domain Administrator will be the same as the password of the local Administrator of this computer. ❗</strong>
</p>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6f66ee18-14e3-4e66-bd69-b084bcecb25c">  <br>
  ❗ <em>If you haven't yet configured a local Admin password when installing the VM, you will run into this error in the Prerequisites Check page</em> ❗
</p>

- The way to remedy this is to change (or create) a local admin password using <a href="https://www.top-password.com/knowledge/change-windows-10-password.html">any of these simple methods here</a>.
- Once the password is updated, we hit the "Rerun prerequisites check" link and can see that there are no errors:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6c11826b-ceab-4efb-9a6b-7b305bca8799">  <br>
  ❗ <em>Please make sure that the password you created is for the Administrator profile and not your current user profile</em> ❗
</p>

- If you're cleared to proceed, you can hit "Install". This will install AD-DS & DNS and restart the system to apply the changes.  <br>
- Once restarted, you will be asked to enter the domain using your previously configured local admin password.

___

<h3>🧯 Initial Security Step 🧯</h3>

- This simple yet essential security measure is needed before proceeding with further configuration steps.  <br>
- What we will do is:  <br>
  * Go to Server Manager in DC1.  <br>
  * Click on Tools in the top right corner.  <br>
  * Select "Active Directory Users and Computers".  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a4808ad8-5c02-4c19-9456-a606e3bf5b87">
  </p>

  * Go to the "Users" container, right-click the "Adminstrator" and copy that user.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/318227b8-8c57-4e02-acb4-eaf722d48295">
  </p>

  * We will give a name to the copied user (This will be the name of the "Super" Administrator) and give the user a password.  <br>
 
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/f8482310-7ee9-406a-bd46-3165ce52bf58">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a37175f9-8f0a-4be6-b85f-bfbc7f116db8">
  </p>  <br>

  * And then proceed with Disabling the user "Administrator":  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/903d1e07-afc1-4c12-b64d-9059469a2682">
  </p>

___

<p align="center">
  <strong>😨 Why did I do that? 😨</strong>  <br>
  <p align="justify">
  <em>When creating a domain controller, it's advisable to duplicate the default Administrator user in Active Directory Users and Computers, assign the new copy a distinct name, and disable the original Administrator account. This precaution is taken because the default Administrator account, which is present in every Windows domain, has a well-known Security Identifier (SID) suffix. The SID is a unique identifier associated with user accounts, and a widely recognized SID could potentially expose the domain to security risks. By renaming and disabling the default Administrator account, you obscure its SID, making it less predictable to potential attackers and enhancing the security posture of the domain</em>
  </p>
</p>

___

- I can demonstrate this by doing the following:  <br>
  * Input this command in CMD in DC1: <code><strong>wmic useraccount getname, sid</strong></code>  <br>
  
  <p align="center">
    ❗ <em>You will get this output (Take note of the numbers for "Administrator")</em> ❗  <br>
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/228b09fd-4802-4f97-b1e3-0ef607a5ec62">
  </p>

  * What is the issue here? Looking at other Windows OSs, you will find a similar pattern:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c4c95ef7-2821-404c-87d1-c28c2b3e1917">
  </p> <br>

  * If we break-down every section of the SID, we will find that it's similar across all accounts except the suffix:  <br>
  * **S-1-5**: SID version information (fixed on all users)  <br>
  * **21-1869958264-2762823925-4193717463**: Domain Identifier (Fixed for all users in the same domain)  <br>
  * **500**: Relative ID (RID), which identifies the specific user; default users in the active directory always start at **500**

<p align="center">
  <em>❗ Any other user created by our <a href="https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/d142a27c-65fb-49c9-9e4b-6ede5f226c8a"> RID Master</a> will begin at 1000. ❗</em>
</p>

___

<p align="center">
  <strong>😨 Now Imagine this scenario. 😨</strong>  <br>
  <p align="justify">
    <em>An unauthorized access occurs on one of your users (be it outside or inside the network/domain), and that threat actor types this simple command:</em> <code><strong>whoami /user</strong></code><em>. This will be his output. One can use this output to get more information about the domain and try to escalate privileges to an Admin level to gain more control of the system</em>
  </p>
</p>  <br>
<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/7d413849-a79e-483e-a4e6-d4fe986ca120">  <br>
  <a href="https://www.sentinelone.com/blog/windows-sid-history-injection-exposure-blog/"><em>Check this technique for example</em></a>  <br>
  <a href="https://praveenhacks.blogspot.com/2009/08/hack-user-through-sid.html"><em>Or fancy this one, maybe?</em></a>  <br>
</p>

___

<h3>👨‍🔧 Adding a Secondary Domain Controller 👨‍🔧(DC2)</h3>

<p align="center">
  <strong>😨 "Do I even need a Secondary Domain Controller?" 😨</strong>  <br>
  <p align="justify">
    <em>Yes!! Adding a secondary domain controller (DC) is essential as it ensures high availability, data redundancy, improved performance, and security in an Active Directory environment. While a forest can technically function with just one DC, the recommended practice is to deploy at least two DCs to prevent disruptions caused by hardware failures or maintenance, maintain data integrity, distribute the load, enhance security, and facilitate efficient management and updates. Relying solely on a single DC is discouraged due to the potential risks associated with a single point of failure.</em>
  </p>
</p>

___

- Now that we have this out of the way, we'll start by first adding the DC2 VM to our newly established domain:  <br>
  * Go to Server Manager on DC2  <br>
  * Switch to the Local Server Page  <br>
  * Click on either "Computer name" or "Workgroup"  <br>
  * Click on change  <br>
  * Select "Domain" and add your previously created domain. In my case, it's "mustafa.com"  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9c944574-1e44-4ef8-98f8-f2c848cf40a7">
</p>  <br>

- Notice that when clicking "Ok" we run into the following error:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/55d8fe52-5bca-4655-b4b2-8f664e99c8e8">
</p>  <br>

- The reason is because our DC1 DNS properties are pointing to Vmwares' Vmnet DNS Service:  <br>
- We will need to configure our DC2 to point to DC1 DNS instead:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a3977a55-c597-4e2b-8069-e4cfb512276d">
</p>  <br>

- Once we insert the DNS of our DC1 and try again, we will be prompted to enter a domain Admin User/pass, and DC2 will be migrated to our domain:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1ea04923-6853-469d-a4e1-1e43a1db26ea">
</p>

___

- Now that we have confirmed that DC2 is part of the domain. We will begin configuring it as a secondary Domain-Controller.  <br>
- The first thing we'll have to do is add DC2 to the "All Servers" Dashboard:  <br>
  * Go to "All Servers" Tab.  <br>
  * Right-click "All Servers" or click on "Manage" at the top-right corner.  <br>
  * Select "Add Server"  <br>
  * Search the name of your DC2 and add it  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0dd991d7-1b58-4f96-a484-0f6056583b25">
</p>  <br>

- Now you have the option to manage DC2 from DC1. This is especially helpful when you're using a Server-Core.

___

- We will go through the same<a href="#-creating--configuring-a-domain-controller-"> exact steps as DC1</a>, but I will highlight the exceptions here:  <br>
  * For the "Server Roles", we will add AD-DS, a secondary DNS, and a File-Server role.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/88b9335c-d2e7-41aa-b3fb-a45fba53b603">
  </p>  <br>

  * Once the Roles are installed. We will "Promote this server to a domain controller" much like before.  <br>
  * Take note, since this is important, We will need to add our DC2 to an existing domain (since we already have one) and specify it:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c5ef1dd4-5252-4a9c-a8cd-199a92b05408">
  </p>  <br>

  * For "DC options" we will maintain the default values and add the previously created DSRM password:  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9c6c9ad4-6922-4204-8e4d-07760f04b7e5">
  </p>  <br>

  * Skip the DNS Options, same as before.  <br>
  * In the "Additional Options" page, we will specify the DC to replicate from any domain controller in the domain (In this case it's DC1)  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a03b77a5-a4c4-41a5-a08a-96bb5388a63b">
  </p>  <br>

  * Paths will be maintained as default.  <br>
  * After reviewing everything, we will continue to "Prerequisites Check". <strong>Don't forget to add a password to the local Administrator if you haven't already done so</strong>  <br>
  * If the Prerequisite Check is successful, hit install, and the Server will reboot.
 
___

- Once the server is rebooted, we will notice that it's no longer in the Domain:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8a772cb3-f263-40b4-9864-e413883f986b">
  </p>  <br>

- This is because 🥁<em>DRUM ROLL...</em>🥁 DNS!!  <br>
- Same as we did earlier, we will need to reconfigure the DNS in the IP address information to point to DC1 instead of DC2 as the preferred and to DC2 as the alternative:  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/28fa1a2a-4481-4074-845b-878c113bbb4c">
  </p>  <br>

- If that doesn't work for you, check the DNS server settings in both DCs to ensure they contain information (SOA/NameServer) on both.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0ea60822-9097-44c1-ba73-dc7d5786f8dc">
</p>  <br>

- If you had to add them manually, confirm the settings and restart DC2, and you will see that it's back in the Domain again:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0e50088f-4e03-4d97-82f2-5af737886ac4">
</p>

___

<h3>🎫 Configure DC2 as the RID Master 🎫</h3>

<p align="center">
  <strong>😨 What in God's Name is a RID Master?? 😨</strong>  <br>
  <p align="justify">
    <em>The RID (Relative Identifier) Master is a crucial Flexible Single Master Operations (FSMO) role in an Active Directory domain. Its primary function is to allocate unique Relative Identifiers (RID) to each domain controller. These RIDs create Security Identifiers (SIDs) for objects like users and groups. Ensuring the uniqueness of SIDs is essential for security and data integrity in the Active Directory. The RID Master is responsible for preventing conflicts and maintaining globally unique SIDs within the domain. In a multi-domain forest, each domain has its own RID Master, and this role can be transferred if necessary.</em>
  </p>
</p>

<p align="center">
  <strong>😨 FSMO?? 😨</strong>  <br>
  <p align="justify">
    <em>FSMO roles are critical components of Active Directory, responsible for various administrative functions. Five FSMO roles exist in an Active Directory forest: the Schema Master, Domain Naming Master, Infrastructure Master, RID Master, and PDC Emulator. Each role has a specific purpose: managing schema updates, domain naming, handling RID allocation, and time synchronization. FSMO roles ensure the proper functioning and integrity of the Active Directory structure. While some roles are forest-wide (Schema Master and Domain Naming Master), others are per-domain (RID Master, Infrastructure Master, and PDC Emulator). FSMO roles can be transferred or seized if needed, but careful planning is essential to maintain the stability and security of the Active Directory environment.</em>
  </p>
</p>

___

- in DC2, We navigate to "Active Directory Users and Computers".  <br>
- We right-click the domain name and select "Operations Masters".  <br>
- A window displays information about All the Domain Roles (RID, PDC, Infrastructure).  <br>
- We will select "RID" and click "change" to transfer the role from DC1 to DC2.  <br>
- Once that's done, you'll get another window confirming the role transfer.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/bfc7ee72-7040-4806-81c4-444f45b5d329">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/083f161c-6789-4974-848f-627370591b88">
</p>

___

<p align="center">
  <strong>😨 "Don't you wanna confirm this through the command line?" 😨</strong>  <br>
  WHY?? I can see it right in front of me... Alright, here are the steps:
</p>  <br>

1. Run the following command in CMD: <code><strong>dcdiag /test:knowsofroleholders /v</strong></code>  <br>
2. You get a bunch of tests.  <br>
3. And viola, we have ourselves a DC2 RID Master.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c81c3973-148d-4427-a04c-658e27cacd17">
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

<h2 align="center"> 🕴️ Active-Directoy Users & Computers Management 🕴️ </h2>

<p align="center">
  <p align="justify">
    <em>In this topic, I will demo some use cases of ADUC, including creating and configuring Organizational Units (OUs), Users, and Groups. I will also demo these steps using the command-line interface, both single object creation and in-bulk using scripts in CMD and PowerShell and we're going to make sure that all of these are synced between both DCs</em>
  </p>
</p>  <br>

<p align="center">
  <strong>😨 "What's that now... ADUC?" 😨</strong>  <br>
  <p align="justify">
    <em>Active Directory Users & Computers (ADUC) is a vital management tool, serving as the primary interface for administering user accounts, groups, and computer objects in an AD environment. It allows administrators to create, modify, and manage user accounts, reset passwords, assign group memberships, organize objects into organizational units (OUs), and oversee domain-wide policies. ADUC also offers advanced features for managing security settings, group policies, and attributes of AD objects, making it an essential tool for maintaining a domain's security, organization, and functionality.</em>
  </p>
</p>

___

<h3>🐒 The ADUC GUI 🐒</h3>

- We will start off by going to ADUC (Tools > ADUC).  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/86bcd6e6-2ebb-434d-9465-3999f5cf882b">
</p>

<p align="center">
  <strong>In the ADUC <a href="https://www.google.com/search?q=gooey&sca_esv=569475139&tbm=isch&sxsrf=AM9HkKms9ViUWIuC98j0IEPXmCmSPQ1Ptg:1695999317076&source=lnms&sa=X&ved=2ahUKEwiFndXmidCBAxV5TKQEHVlHABYQ_AUoAXoECAEQAw&biw=1920&bih=931&dpr=2">GUI</a> we can see these primary components</strong>
</p>

- **Forest**: A collection of one or more domains that share a common schema, configuration, and global catalog. Forests are the highest level of organization in Active Directory.  <br>
- **Domain**: A logical grouping of objects within Active Directory. Domains define administrative boundaries and security boundaries within a forest.  <br>
- **FSMO Roles**: Specialized roles that manage specific operations within Active Directory.  <br>
- **Containers**: A basic (Default) Organizational Unit for grouping objects within Active Directory.  <br>
- **Organizational Unit**: A specialized container that allows for a more granular organization of objects.  <br>
- **Objects**: a basic unit representing various resources like users, groups, computers, etc. Objects have unique properties and attributes organized within the directory structure.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/377fe417-abb9-45a5-9c26-e609a8642aba">
</p>

___

<h3>🏭 Creating OUs, Users & Groups Using the GUI 🏭</h3>

- To create new Organizational Units, you will need to take these steps:<br>
  * Right-click the domain you want to create the OUs on.
  * Select New > Organizational Unit.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/fd8be967-74b5-4e27-8f83-70028d8c6620">
</p>  <br>

  * A window will pop up asking you to input the OU name.
  * You will also have the option to select "Protect container from accidental deletion" - Which I recommend keeping.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/edf2cefa-d2f6-48ef-97ff-352576bc66bb"><br>
  <strong>"That Protect option sounds fancy. What does it do?"</strong><br>
  <em>When trying to delete the container, a window pops to ask, "Are you sure you'd like to get fired today?", you have the option to accept, but umm, well...</em><br>
  🦗 <a href="https://www.youtube.com/watch?v=CpGtBnVZLSk&ab_channel=GamingSoundFX"><strong>*Cricket Sounds*</strong></a> 🦗
</p>

  * Click "OK" and you have yourself a brand-new OU. Well, I created two.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ec25d914-bdae-4674-9f69-41efcab93866">
</p>

___

- Now, let's create new users in our OUs. Here are the needed steps:  <br>
- Select the designated OU.  <br>
- Right-click it, or it's empty directory.  <br>
- Select New > User  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/3086897b-622d-4a29-ab97-eb06a0fc1d11">
</p>  <br>

- A window pops up so you can fill out basic info about the new user:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/b3130dc2-51ca-49ad-a44e-4835de4b50c3">
</p>  <br>

- Next, we will need to specify a password and its settings. They're self-explanatory, but let me go over their use case:  <br>
  1. **Change password at next logon:** recommended. First login passwords are easy and generic, making first logon easier for new users.  <br>
  2. **User cannot change password:** For services that require a fixed password. Or guests, where you have more control over their account.  <br>
  3. **Password never expires:** For services, Super-Administrative or critical users, and specialized accounts.  <br>
  4. **Account is disabled:** For templates, bulk account creation, Temporary/Seasonal users, testing, and Security review before deployment.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c02e5247-7ccb-4b52-bd29-d8830aeb9843"><br>
  <em>❗ There are many use cases out there, of course. These are just examples ❗</em>
</p>  <br>

- Once you choose the desired settings, review them and "Finish". Congratulations, you have your first users!  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/29a427ea-56c3-49b3-8dc6-27a018f88ec0">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/5342631d-2c2f-45c7-b50d-173493e47430">
</p>

___

- For group creation, We will create a group for each OU and make our new users Members of these groups.  <br>

<p align="center">
  <strong>😨 "Wait, what is the purpose of a group?" 😨</strong>
  <p align="justify">
    <em>The purpose of a group in Active Directory is to simplify user and resource management by grouping users, computers, or other objects. Groups make it easier to assign permissions, access rights, and policies collectively to multiple objects, reducing administrative complexity and enhancing security and resource management.</em>
  </p>
</p>  <br>

- Right-click the desired OU > New > Group.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0383e3ac-3d02-4008-945e-f4c0e893d1e1">
</p>  <br>

- A window pops up asking you to input the group name and select the desired group settings:  <br>
  * **Group Scope:** determines where a group's membership is valid.  <br>
    * **Domain local:** for resource access within one domain.<br>
    * **Global:** for users and groups within one domain.<br>
    * **Universal:** for resource access across domains in a forest.  <br>
  * **Group Type:** whether a group is security-enabled or distribution-enabled.  <br>
    * **Security:** for security-related purposes, such as granting access permissions.<br>
    * **Distribution:** for sending email and organizing users for non-security purposes like distribution lists.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/299eaee1-8d49-40da-91cc-3cd50bd5b15c">
</p>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/See-Security-logo.png">
</p>

<h1 align="center"> Microsoft Server Module (MCSA) </h1>
<h2 align="center"> ⚰️ Server Management in Active-Directory ⚰️ </h2>
<h4 align="center"> Student Name: <a href="https://www.linkedin.com/in/mustafa-jaber-5a143b269/">Mustafa Jaber</a> | <a href="https://see-security.com/?lang=en">See-Security College, Ramat-Gan</a> | Class: CSPP83 | Lecturer: Binyamin Cohen | 10/10/2023 </h4>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

  <h2 align="center"> 🗺️ Topology 🗺️ </h2>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Topology-Screenshot.png" height="400px" width="auto"> 
</p>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 📑 Table of Contents 📑</h2>

<ol>
  <li><a href="#-%EF%B8%8F-topology-%EF%B8%8F-"> Topology</a></li>
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
    <summary><a href="#--dhcp-configuration--"> DHCP Configuration</a></summary>
    <ol>
      <li><a href="#-pre-requesite-steps-"> <em>Pre-requisite Steps</em></a></li>
      <li><a href="#-configuring-a-dhcp-scope-"> <em>Configuring a DHCP Scope</em></a></li>
      <li><a href="#-testing-our-dhcp-scope-"> <em>Testing our DHCP Scope</em></a></li>
      <li><a href="#-configuring-a-failover-cluster-"> <em>Configuring a Failover Cluster</em></a></li>
    </ol>
  </details></li>
  <li><details open="open">
    <summary><a href="#-%EF%B8%8F-configuring-routing--pat-on-srv1-%EF%B8%8F"> Configuring Routing & PAT on SRV1</a></summary>
      <ol>
        <li><a href="#-pre-requisite-steps-"> <em>Pre-requisite Steps</em></a></li>
        <li><a href="#%EF%B8%8F-installing--configuring-routing--remote-access-services-rras-%EF%B8%8F"><em> Configuring Routing & Remote Access Services (RRAS)</em></a></li>
      </ol>
  </details></li>
  <li><details open="open">
    <summary><a href="#-%EF%B8%8F-active-directoy-users--computers-management-%EF%B8%8F-"> Active Directory Users & Computers Management</a></summary>
    <ol>
      <li><a href="#-the-aduc-gui-"> <em> The ADUC GUI</em></a></li>
      <li><a href="#creating-ous-users--groups-using-the-gui"> <em> Creating OUs, Users & Groups Using the GUI</em></a></li>
      <li><a href="#-creating-ous-users--groups-using-cmd-"> <em> Creating OUs, Users & Groups Using CMD</em></a></li>
    </ol>
  </details></li>
</ol>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🚪 Introduction 🚪 </h2>

<p align="justify">
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a meticulously designed network infrastructure, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, Group Policies, user management, security protocols, organizational efficiency, remote access solutions, and comprehensive documentation. This project underscores my expertise in Microsoft technologies and network security principles, emphasizing the pivotal role of a well-structured directory service in modern network management.
</p>

<div align="center">
  
|[☝️ Back to top ☝️](#--introduction--)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🧰 Requirements for the lab environment 🧰 </h2>

1. [Vmware Workstation Pro](https://www.vmware.com/il/products/workstation-pro.html)
2. [Windows Server 2019 VM's (3 Machines)](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
3. [Windows 10/11 Pro VM's (2 Machines)](https://www.microsoft.com/en-us/software-download/windows10)

<div align="center">
  
|[☝️ Back to top ☝️](#--requirements-for-the-lab-environment--)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🏗️ Setting up the lab environment 🏗️ </h2>

<p align="center"> 
  <strong>I will not be diving deep into Vmware since this is out of the scope of this project</strong>  <br>
  <a href="https://medium.com/r3d-buck3t/building-an-active-directory-lab-part-1-windows-server-2022-setup-7dfaf0dafd5c">
    👉 <em>You can check this link here for a guide</em></a> 👈
</p>

___

- We will start by setting up the lab environment in 5 virtual machines in Vmware Workstation Pro. It will Consist of 2 Domain Controllers, a routing server (PAT) (3 Windows Server 2019 OS's), and two end-user clients hosting Windows 10 Pro.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-1.png"> 
</p>

___

- It is essential to ensure that each virtual machine is configured to NAT and that you have NAT already configured in your Vmware Workstation Pro settings.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-2.png" height="500px" width="auto">
</p>

___

> [!NOTE]  
> <em>I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active-Directory services.</em>

___

- Once that's done, begin installing the Operating System individually, and then we will do some basic setting up for both DCs and SRV-1 (basic networking settings).  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-3.png"> 
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-4.png" height="auto" width="500px">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-5.png" height="auto" width="500px">
</p>

___

> [!NOTE]  
> *The reason that the "Host" portion of the IP address is "3" and not "1" or "2" for example is because these two "Host" addresses are reserved for Vmwares' NAT operation:*  
> - *"1" is for the NAT bridge installed on the host machine.*  
> - *"2" is for the virtual switch (Default-Gateway).*

  <p align="center">
    <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">
      <em>👉 Here's more details on the subject 👈</em></a>
  </p>

___

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller)  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-6.png" height="auto" width="500px">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-7.png" height="auto" width="500px">
</p>

___

> [!NOTE]  
> *Restart, repeat the same steps in DC2 and SRV1 with their corresponding names, and use the IP addresses with "4" and "5" as the hosts.*

___

<div align="center">
  
|[☝️ Back to top ☝️](#-%EF%B8%8F-setting-up-the-lab-environment-%EF%B8%8F-)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>
  
![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🤔 Creating & Configuring a Domain Controller 🤔 </h2>

<p align="center">
  <em>In this section of the project, we will be exploring the steps needed to create Two domain controllers properly (I will explain the rationale during setup) and talk briefly about the features and options that will come across during setup.</em>
</p>  <br>

___

<strong>Here are the topic that we're going to cover:</strong>  <br>

|[1. Creating Server Roles ▶️](#--creating-server-roles-)|
|---|

|[2. Configuring our 1st Domain Controller ▶️](#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-)|
|---|

|[3. Intial Security Step ▶️](#-initial-security-step-)|
|---|

|[4. Adding a Secondary Domain Controller (DC2) ▶️](#-adding-a-secondary-domain-controller-dc2)|
|---|

|[5. Configure DC2 as the RID Master ▶️](#-configure-dc2-as-the-rid-master-)|
|---|

___

<h3> 🧻 Creating Server Roles 🧻</h3>

- The first step to creating a domain is to create a Domain-Controller (DC for short). For that, we will go to the Server Manager Application > Click on Manage at the top right and then add Roles and Features  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-1.png"> 
</p>

___

- We will go through the setup wizard to add the needed roles (I skipped the first page by default since it's not necessary)  <br>
- In the installation wizard, we must choose between "Role-based or feature-based installation" and "Remote Desktop Services installation".  <br>
- To install a Domain-Controller, select "Role-based or feature-based installation."  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-2.png">  <br>
  <strong>😨 What is the difference? 😨</strong>
</p>

<p align="justify"> 
  <em>Role-based or feature-based installation configures the server's core roles and optional features to provide fundamental services in your network environment. Remote Desktop Services installation, on the other hand, is specifically focused on enabling remote desktop access and application delivery for multiple users. In an Active Directory environment, you might use role-based or feature-based installation to set up essential services like Domain Controllers, DNS, and DHCP. Afterward, if you need to provide remote desktop access to users, you would install the Remote Desktop Services role separately to cater to that specific requirement.</em>
</p>

___

- The next step is to select the server from the server pool. Here, I will choose my current server, "DC1-Mustafa".  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-3.png">
</p>

___

> [!NOTE]  
> *We cannot see "DC2" and "SRV1" even though they're in the same subnet because we haven't created a domain yet*

___

- In the "Server Roles" page, we will select the following roles for DC1 and add all of their features:  <br>
  * "Active Directory Domain Services"  <br>
  * "DHCP Server" - We will need it to give out IP information for our clients on the domain.  <br>
  * "DNS Server" - We will configure this as our primary DNS for the domain.  <br>
  * The already (partially) selected "File and Storage Services"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-4.png"> 
</p>

- We will skip the "Features" page since we already selected all the features for the corresponding Server Roles we added.  <br>
- We will also skip all the "About" pages on each Server Role we added.

___

- Then we will reach the "Confirmation" page and hit "Install"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-5.png">
</p>

___

> [!NOTE]  
> *We will not need to check the "Restart..." box since this is a local Server.*

___

- Once the wizard is done installing, you are given the option to "Promote this server to a domain controller":  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-6.png">
</p>

___

- Note that if you reach this point and hit "Close" instead of "Promote this server to a domain controller", then there's no need to panic and follow these steps:  <br>
  * On the top right of the Server Manager UI, you will see a flag with ⚠️ on it.  <br>
  * When clicking on it, you will see the tasks that must be completed. Among them is Promoting the server.  <br>
  * You can click on the task to resume the configuration.  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-7.png">
</p>

___

<h3> ☣️ Configuring our 1st Domain Controller ☣️ </h3>
- We must select the "Add a new forest" operation for the first deployment.  <br>
- Then specify the "Root Domain Name". In my case, it will be "mustafa.com".  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-1.png">  <br>
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
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-2.png">
  </p>

___

- I will skip the DNS options since we will not cover DNS delegation in this step.  <br>
- In the Additional Options page, the NetBIOS domain name will be automatically generated from the root domain name we specified earlier. <a href="http://www.differencebetween.net/technology/internet/difference-between-dns-and-netbios/">Here's more info on NetBIOS</a>.  <br>
- In the "Paths" page, we can see and edit the default folders for:  <br>
  * Database: NTDS is a critical component of the Active Directory infrastructure, housing the database files that store directory information.  <br>
  * Log files: Log files associated with AD database contain transaction logs that record all changes made to the database.  <br>
  * SYSVOL: Responsible for storing and distributing Group Policy objects and other system-level settings (Scripts, for example) across all domain controllers.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-3.png">
</p>

___

- Lastly, we will reach the "Review Options" page, where we can review all the configurations we did. Take note of the following sentence:  <br>
<p align="center">
  <strong>❗ The password of the new domain Administrator will be the same as the password of the local Administrator of this computer. ❗</strong>
</p>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-4.png">
</p>

___

> [!NOTE]  
> *If you haven't yet configured a local Admin password when installing the VM, you will run into this error in the Prerequisites Check page.*

___

- The way to remedy this is to change (or create) a local admin password using <a href="https://www.top-password.com/knowledge/change-windows-10-password.html">any of these simple methods here</a>.
- Once the password is updated, we hit the "Rerun prerequisites check" link and can see that there are no errors:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-5.png">  <br>
</p>

- If you're cleared to proceed, you can hit "Install". This will install AD-DS & DNS and restart the system to apply the changes.  <br>
- Once restarted, you will be asked to enter the domain using your previously configured local admin password.

___

> [!NOTE]  
> *Please ensure the password you created is for the Administrator profile and not your current user profile.*

___

<h3>🧯 Initial Security Step 🧯</h3>

- This simple yet essential security measure is needed before proceeding with further configuration steps.  <br>
- What we will do is:  <br>
  * Go to Server Manager in DC1.  <br>
  * Click on Tools in the top right corner.  <br>
  * Select "Active Directory Users and Computers".  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-1.png">
  </p>

  * Go to the "Users" container, right-click the "Adminstrator" and copy that user.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-2.png">
  </p>

  * We will give a name to the copied user (This will be the name of the "Super" Administrator) and give the user a password.  <br>
 
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-3.png">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-4.png">
  </p>  <br>

  * And then proceed with Disabling the user "Administrator":  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-5.png">
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
    ❗ <em>You will get this output (Note of the numbers for "Administrator")</em> ❗  <br>
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-6.png">
  </p>

  * What is the issue here? Looking at other Windows OSs, you will find a similar pattern:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-7.png">
  </p> <br>

  * If we break-down every section of the SID, we will find that it's similar across all accounts except the suffix:  <br>
  * **S-1-5**: SID version information (fixed on all users)  <br>
  * **21-1869958264-2762823925-4193717463**: Domain Identifier (Fixed for all users in the same domain)  <br>
  * **500**: Relative ID (RID), which identifies the specific user; default users in the active directory always start at **500**  <br>

___

> [!NOTE]  
> *Any other user created by our <a href="https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/d142a27c-65fb-49c9-9e4b-6ede5f226c8a">RID Master</a> will begin at 1000.*

___

<p align="center">
  <strong>😨 Now Imagine this scenario. 😨</strong>  <br>
  <p align="justify">
    <em>An unauthorized access occurs on one of your users (be it outside or inside the network/domain), and that threat actor types this simple command:</em> <code><strong>whoami /user</strong></code><em>. This will be his output. One can use this output to get more information about the domain and try to escalate privileges to an Admin level to gain more control of the system</em>
  </p>
</p>  <br>
<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/initial-security-step-8.png">  <br>
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-1.png">
</p>  <br>

- Notice that when clicking "Ok" we run into the following error:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-2.png">
</p>  <br>

- The reason is because our DC1 DNS properties are pointing to Vmwares' Vmnet DNS Service:  <br>
- We will need to configure our DC2 to point to DC1 DNS instead:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-3.png">
</p>  <br>

- Once we insert the DNS of our DC1 and try again, we will be prompted to enter a domain Admin User/pass, and DC2 will be migrated to our domain:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-4.png">
</p>

___

- Now that we have confirmed that DC2 is part of the domain. We will begin configuring it as a secondary Domain-Controller.  <br>
- The first thing we'll have to do is add DC2 to the "All Servers" Dashboard:  <br>
  * Go to "All Servers" Tab.  <br>
  * Right-click "All Servers" or click on "Manage" at the top-right corner.  <br>
  * Select "Add Server"  <br>
  * Search the name of your DC2 and add it  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-5.png">
</p>  <br>

> [!NOTE]  
> *Now you have the option to manage DC2 from DC1. This is especially helpful when you're using a Server-Core.*

___

- We will go through the same<a href="#-creating--configuring-a-domain-controller-"> exact steps as DC1</a>, but I will highlight the exceptions here:  <br>
  * For the "Server Roles", we will add AD-DS, a secondary DNS, and a File-Server role.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-6.png">
  </p>  <br>

  * Once the Roles are installed. We will "Promote this server to a domain controller" much like before.  <br>
  * Take note, since this is important, We will need to add our DC2 to an existing domain (since we already have one) and specify it:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-7.png">
  </p>  <br>

  * For "DC options" we will maintain the default values and add the previously created DSRM password:  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-8.png">
  </p>  <br>

  * Skip the DNS Options, same as before.  <br>
  * In the "Additional Options" page, we will specify the DC to replicate from any domain controller in the domain (In this case it's DC1)  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-9.png">
  </p>  <br>

  * Paths will be maintained as default.  <br>
  * After reviewing everything, we will continue to "Prerequisites Check". <strong>Don't forget to add a password to the local Administrator if you haven't already done so</strong>  <br>
  * If the Prerequisite Check is successful, hit install, and the Server will reboot.
 
___

- Once the server is rebooted, we will notice that it's no longer in the Domain:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-10.png">
  </p>  <br>

- This is because 🥁<em>DRUM ROLL...</em>🥁 DNS!!  <br>
- Same as we did earlier, we will need to reconfigure the DNS in the IP address information to point to DC1 instead of DC2 as the preferred and to DC2 as the alternative:  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-11.png">
  </p>  <br>

- If that doesn't work for you, check the DNS server settings in both DCs to ensure they contain information (SOA/NameServer) on both.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-12.png">
</p>  <br>

- If you had to add them manually, confirm the settings and restart DC2, and you will see that it's back in the Domain again:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-13.png">
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/rid-master-1.png">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/rid-master-2.png">
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/rid-master-3.png">
</p>

<div align="center">
  
|[☝️ Back to top ☝️](#--creating--configuring-a-domain-controller--)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🛂 DHCP Configuration 🛂 </h2>

<p align="center">
  <strong>😨 "Why do I need DHCP in an MS Server Environment?" 😨</strong>  <br>
  <p align="justify">
    <em>DHCP, or Dynamic Host Configuration Protocol, is a network service used in Microsoft Server to automatically assign IP addresses and related network configuration settings to devices on a network. Its primary use case is to simplify and streamline IP address management, making deploying and managing many computers and devices in a network easier. DHCP ensures that each device on the network receives a unique IP address, subnet mask, default gateway, DNS server addresses, and other configuration parameters, reducing the administrative overhead of manually configuring each device's network settings. This automation especially benefits large corporate networks, reducing errors and ensuring efficient IP address allocation.</em>
  </p>
</p>  <br>

<p align="center">
  <strong>😨 "Why are you configuring DHCP now?" 😨</strong>  <br>
  <p align="justify">
    <em>The reason is that I will require DHCP services in the next chapter when testing our user creations on a Windows 10 Pro log in to our domain. I don't want to configure a Windows 10 pro, then configure a DHCP then reconfigure the Windows Client again.</em>
  </p>
</p>

___

<strong>Here are the topic that we're going to cover:</strong>  <br>

|[1. Pre-requisite Steps ▶️](#-pre-requesite-steps-)|
|---|

|[2. Configuring a DHCP Scope ▶️](#-configuring-a-dhcp-scope-)|
|---|

|[3. Testing our DHCP Scope ▶️](#-testing-our-dhcp-scope-)|
|---|

|[4. Configuring a Failover Cluster ▶️](#-configuring-a-failover-cluster-)|
|---|

___

<h3>🚶 Pre-requesite Steps 🚶</h3>

- Since we have already installed our DHCP service on DC1 in the <a href="#--creating-server-roles-">Server Roles chapter</a>. I will now jump directly into the DHCP configuration.  <br>
- We will click on our "Tasks" tab and select "Complete DHCP configuration":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/DHCP-pre-requisite-steps-1.png">
</p>  <br>

- This will take us to a window where we have to specify the user authorization - the same as previous steps:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/DHCP-pre-requisite-steps-2.png">
</p>  <br>

- This will finish the initial DHCP configuration, and we can begin our in-depth DHCP configuration.

___

<h3>🔭 Configuring a DHCP Scope 🔭</h3>

- Now we will create a new <strong><a href="https://learn.microsoft.com/en-us/windows-server/networking/technologies/dhcp/dhcp-scopes">DHCP Scope</a></strong> and customize its settings to match our domain needs.  <br>
- The first step is to go to "Tools"> Select "DHCP" and a window for the DHCP service will pop up:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-1.png">
</p>  <br>

- We will configure a new DHCP scope by right-clicking "IPv4"> select "New Scope...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-2.png">
</p>  <br>

- This will open an installation wizard window, we will begin by specifying the scope name and description:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-3.png">
</p>  <br>

- I will configure the DHCP scope to lease 50 addresses in total for my domain:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-4.png">
</p>

___

> [!NOTE]  
> *Your Start/End addresses will be different according to the subnet you're in and your use case*

___

- I will be excluding the first 5 addresses from the scope. This will bring the total down to 45 addresses:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-5.png"><br>
  <strong>😨 "What is the purpose of address exclusion?" 😨</strong>  <br>
  <p align="justify">
    <em>It ensures that these addresses are not automatically assigned to client devices. Exclusion is typically used for network devices with statically configured IP addresses, such as servers, routers, or printers, ensuring that the DHCP server does not allocate these reserved addresses to other devices. Address exclusion helps maintain network stability, preventing IP address conflicts and ensuring that critical network resources always have their designated addresses available for use.</em>
  </p>
</p>

___

- Then we will define the Lease Duration, which will be 8 hours:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-6.png"><br>
  <strong>😨 "What is the purpose of Lease Duration?" 😨</strong>  <br>
  <p align="justify">
    <em>The lease duration in DHCP specifies how long a client device can use an IP address and network configuration. Its purpose is to efficiently manage IP address allocation, adapt to changing network needs, facilitate IP address reclamation, support load balancing, and enhance network security. The choice of lease duration depends on network requirements, balancing address management efficiency, network stability, and security considerations. Shorter leases suit devices with frequent connections, while longer leases are suitable for stable connections and resource planning.</em>
  </p>
</p>

___

- Now we're given the choice to define the DHCP options (which I'll explain shortly) or opt out of them for now.  <br>
- We will define these options from the get-go since I like living on the edge:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-7.png">  <br>
  <strong>😨 "So what are DHCP options?" 😨</strong>  <br>
  <p align="justify">
    <em>They are additional parameters that a DHCP server can provide to client devices alongside the essential IP address and subnet mask. These options include settings such as the default gateway, DNS server addresses, domain names, time servers, and more.</em>
  </p>
</p>

___

- The first step is to define our Default-Gateway (Router) Address. Here, I will not specify the Vmware NAT, but Instead, I will add the address of our SRV1. If you look back at our <a href="#-%EF%B8%8F-topology-%EF%B8%8F-">Topology</a> You can see that we will be configuring our SRV1 as a routing server.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-8.png">
</p>  <br>

- Next, we will Define our Parent domain and DNS servers, which we already configured in previous steps:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-9.png">
</p>  <br>

- We will skip the "WINS" section since it's not necessary for this project, but here's more 👉 <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/setting-wins-server-options">info</a> 👈 on the subject.  <br>
- Now select "Yes. I want to activate this scope now" So that it gets activated on clients who request DHCP leases.

___

<h3>🧪 Testing our DHCP Scope 🧪</h3>

- It's time to test our DHCP configuration and see if it works properly.  <br>
- We will fire up a Windows 10 Pro image that we prepared during the <a href="#--requirements-for-the-lab-environment--">requirements for the lab environment</a>.  <br>
- As soon as we log in to the OS, we are automatically Added to the domain using our Admin User (in my case SuperSalmon):  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/21f578a1-e0a7-4c31-a10a-495906f1e7a7">
</p>  <br>

- And if we check using <code><strong>ipconfig /all</strong></code>:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8845f140-04f7-4567-b24b-a12e95ff1ffa">
</p>  <br>

- Here, we can see all the parameters we previously configured:  <br>
  * The domain ✔️  <br>
  * IP address which took the suffix "26", which means our exclusion rule worked ✔️  <br>
  * The lease that expires in 8 hours ✔️  <br>
  * The default-Gateway which is SRV1 ✔️  <br>
  * The DHCP Server, which is DC1 ✔️  <br>
  * The DNS servers, which is both DC1 and DC2 ✔️  <br>

- We can also verify that windows 10 is connected to domain by pinging our DCs:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/44046531-d5b6-42f3-b081-07fc6abd304f">
</p>

___

<h3>🚧 Configuring a Failover Cluster 🚧</h3>

- Now let's move on to creating a Failover Cluster to DHCP.

<p align="center">
  <strong>😨 "A Failover Cluster?! I thought we were done with DHCP!" 😨</strong>  <br>
  <p align="justify">
    <em> Yeah, sure. You can stop here... Why would you need a Failover Cluster?... BAM! Your DC1 decided it's taking a holiday, along with its DHCP server to the digital Caribbean, In 8 hours, all of your DHCP clients are going to lose their lease and, therefore, lose their IP address information. Do you think you have the wits to fix the issue in less than 8 hours? at midnight? oh, you forgot the keys? you're having a gut-wrenching diarrhea? Do you think you can survive all the human factors and restore stability to your organization before all hell breaks loose?</em>
  </p>
</p>

<p align="center">
  <strong>😨 "I get your point. What is a Failover Cluster, then?" 😨</strong>  <br>
  <p align="justify">
    <em>A failover cluster ensures high availability and load balancing for DHCP services, improving network reliability. In Load Balance mode, both servers share the DHCP client load, while in Hot Standby mode, one server is active while the other is on standby, ready to take over if the active server fails. This setup helps prevent DHCP service interruptions and is especially valuable in environments where uninterrupted IP address assignment is critical.</em>
  </p>
</p>

___

- The first step is to create a DHCP server role in DC2 using the same steps we took when we <a href="#--creating-server-roles-">configured a DHCP server on DC1</a>; By selecting the DHCP server role and adding it's features.  <br>
- Then we go through the initial configuration, the same way we did <a href="#--dhcp-configuration--">here</a>  <br>
- Now that we're done with the initial configuration, we will move to DC1 DHCP tools.  <br>
- We will right-click "IPv4" again and select "Configure Failover..."  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/efea059c-6e6f-4442-b13c-914357147f03">
</p>  <br>

- An installation wizard will open up, asking us which scopes we would like to configure for the failover.  <br>
- We will select the one we already created since we want our Secondary DHCP to take over the same functions:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6ab3aa66-3726-45d7-8fca-8bb23e7c586f">
</p>  <br>

- On the next page, we're asked to specify the server we want to configure as a Failover DHCP. We will select "Add Server" and add DC2 as the Partner Server and click Next:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/932ecaa3-f1ec-4a28-9ac6-f3352743b8b9">
</p>  <br>

___

> [!NOTE]  
> *If you don't see DC2 in the "Authorized DHCP Servers", you should refresh the Server Manager UI.*

___

- The next page is where we lay out the details of the Failover Relationship:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c0e02983-41d8-4c80-b3d8-6e859427a12e">
</p>  <br>

- Here's a detailed explanation of each Parameter and their use cases:  <br>

| Parameter | Description |
| --------- | ----------- |
| <strong>Relationship Name</strong> | Assign a unique name to identify the failover relationship. It helps distinguish this relationship from others if you have multiple configurations. |
| <strong>Maximum Client Lead Time</strong> | Specifies the maximum time by which a client can extend its lease beyond the duration offered by the failed DHCP. |
| <strong>Mode</strong> | <ul><li><strong>Load Balance:</strong> Both servers actively serve DHCP clients, sharing the load. It's suitable for distributing client requests across both servers.</li><li><strong>Hot Standby:</strong> One server is active, and the other is on standby. The standby server only takes over the DHCP service if the active server fails.</li></ul>|
| <strong>Addresses Reserved for Standby Server</strong> | You can specify a pool of IP addresses that will be reserved and not used for DHCP assignments. This is useful for maintaining a buffer of unused addresses for failover situations.|
| <strong>State Switchover Interval</strong> | This is unrelated to Hot-Standby. It represents the interval at which the roles of the two DHCP servers in a relationship switch between the primary and secondary DHCP servers in Load-Balance mode. |
| <strong>Enable Message Authentication</strong> | allows for the authentication of messages exchanged between the DHCP servers in a failover relationship. It ensures that the messages transmitted between the servers are secure and have not been tampered with during transmission.|
| <strong>Shared Secret</strong> | A secret key shared only between both servers to communicate securely - Required if Message Authentication is Enabled.|

- The last page shows a review of your configuration to confirm and apply, click "Finish".  <br>
- Once you click "Finish" a log window will pop-up to show you the progress of installing the failover configuration:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/aa68dbf3-3713-4a84-9194-9050900bf871">
</p>  <br>

- We can confirm this by checking the description of the Scope we created at the beginning and see that the failover relationship was applied:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/be2f8db1-7db4-40f6-b969-b6e5afddb418">
</p>

<div align="center">
  
|[☝️ Back to top ☝️](#--dhcp-configuration--)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> ☎️ Configuring Routing & PAT on SRV1 ☎️</h2>

<p align="center">
  <strong>😨 "What is PAT?" 😨</strong>
  <p align="justify">
    <em>Port Address Translation is a network address translation (NAT) technique that enables multiple devices within a private network to share a single public IP address. It achieves this by mapping different private IP addresses and port numbers to a single public IP address and port number, facilitating efficient internet access for multiple devices while conserving public IP addresses. We're essentially, in simple terms, converting SRV1 into a router for our domain LAN.</em>
  </p>
</p>

<p align="center">
  <strong>😨 "What are the use cases? You already have Vmware NAT"</strong>
  <p align="justify">
    <em> Using a Windows Server as a PAT router is advantageous in scenarios where integration with the Windows environment, centralized management, limited budget or resources, testing, and development, or customization and scripting are priorities. It can simplify management within a Windows-centric ecosystem and be cost-effective in smaller environments. However, traditional routers and dedicated networking hardware typically outperform Windows Servers regarding performance and reliability. VMware NAT, on the other hand, is well-suited for virtualized environments but may lack the level of control and integration found in a Windows Server setup. In a dedicated PAT Windows Server, you can activate <a href="https://docs.netscaler.com/en-us/citrix-sd-wan/current-release/dhcp-server-and-dhcp-relay.html#:~:text=A%20DHCP%20relay%20agent%20is,and%20a%20remote%20DHCP%20Server.">DHCP Relay Agent</a>, Enable packet capture and analysis, and create firewall policies in the PAT Server. Capabilities which are not found in Vmware NAT.</em>
  </p>
</p>

<p align="center">
  <strong>👉 <a href="https://learn.microsoft.com/en-us/windows-server/remote/remote-access/remote-access">Here's more details on the subject</a> 👈</strong>
</p>

___

<h3>🚶 Pre-requisite Steps 🚶</h3>

- The first step to configure PAT on SRV1 is to make sure that your Server has two network cards installed.  <br>
- Since we're using a virtual environment, we're going to simply add another virtual NIC to our SRV1 by going to its settings:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/d261bb3e-df35-45e9-87ef-108f450298b5">
</p>  <br>

- Then we will select and add a "Network Adapter":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/4019c564-bafb-4328-bdad-39e5c7e56963">
</p>  <br>

- And make sure that this new adapter is configured to "Bridged" Since this NIC will be facing our internal network:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ccc310a4-f5b7-43fe-9fbb-940a8179b315">
</p>  <br>

- Once that's done, we can see both NICs on the "Network Connections" page:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/185fc933-8ae2-4f03-8d0d-e1bbb188c056">
</p>  <br>

- But how can we identify which NIC is internal and which is external?  <br>
- Luckily, we already configured our external NIC to the VMware NAT.  <br>
- Double-click one of the NICs and select "Details..."  <br>
- If you check the Default Gateway, you'll find the ".2" suffix, the VMware NAT:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/12bae089-dbce-4986-a6f3-8abb7accf3b2">
</p>  <br>

- We will also change the IP address of this NIC, since we will be using the ".5" suffix for our SRV1 Router:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/701e7464-2175-4013-81b0-6f159555ecce">
</p>  <br>

- This is our External NIC. Let's call it "WAN" and the other NIC will be "LAN": <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9087c571-5e88-4c01-9d6e-85bccf36337c">
</p>  <br>

- We will also change the IPv4 information of our LAN NIC:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/40f07de6-84ae-4206-8940-d34374b361d2"><br>
  <strong>😨 "You... missed the Default Gateway?" 😨</strong><br>
  <p align="justify">
    <em>I did not. I intentionally haven't configured it with a default gateway because a bridged network relies on the default gateway present in the network it's bridged with. In this case, it's bridged to our NAT, and the NAT, in turn, handles the actual routing for it. </em>
  </p>
</p>

<p align="center">
  <strong>😨 "Why the whole work-around?" 😨</strong><br>
  <p align="justify">
    <em>Because the Remote Access Role enables advanced routing features that cannot be found on the VMware NAT. Configuring it on our bridged NIC will act as a Gateway to our internal network, handling all of their requests, filtering, capturing data, and passing it through configured policies and rules. Once it's all passed, our "Internal" Router will pass that data to our NAT NIC, handling the more straightforward routing.</em>
  </p>
</p>

___

- Once this initial configuration is complete, we will add our SRV1 to the domain.  <br>
- Go to your WAN NIC and change the DNS to point to one of your DNS Servers:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/26b91440-34ce-4338-a87f-d1e16e07a4d0">
</p>  <br>

- Like we previously did with our DCs, we will select the "Computer Name" in the Server Manager UI:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/f6d13aef-9d89-4824-853f-3a0f9bf911e0">
</p>  <br>

- Select "Change..." > Domain > Add your domain name.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ff7f63b1-8cbc-4c02-82f6-348b8d479f9e">
</p>  <br>

- Once you confirm your settings, a window will pop-up asking for Domain credentials.
- The server will restart and enter the domain.


___

<h3>🛠️ Installing & Configuring Routing & Remote Access Services (RRAS) 🛠️</h3>

- Now that we're done with the pre-requisites, let's dive into creating the actual RRAS Server on our Windows Server Machine.  <br>
- We will begin by going to Manage > Selecting "Add Roles and Features".  <br>
- Select "Role-based or feature-based installation".  <br>
- Select our SRV1 from the server pool like we did with our DCs.  <br>
- In the "Server Roles" Tab, we will scroll-down and select the "Remote Access" role:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/53867404-8fa1-488a-9160-e6d40941698b">
</p>  <br>

- We will not change anything with the feautres.  <br>
- Once we get to the Role Services tab, we will need to select "Routing":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/26094bf5-062f-4020-8f87-ab68cbfa5fd1"><br>
  <strong>😨 "Why did "DirectAccess and VPN (RAS)" get automatically selected?!" 😨</strong><br>
  <p align="justify">
    <em>The role is mandatory when selecting "Routing" because routing and VPN services are closely linked. Routing often involves secure data transfer between networks, where VPNs play a crucial role. This bundled setup simplifies configuration and caters to common scenarios where both routing and VPN services are needed, offering flexibility to enable or disable specific features based on your requirements during setup.</em>
  </p>
</p>  <br>

- Once we confirm our selection, we will select Next until we reach the confirmation tab and install the Role.  <br>

- We will not select the "Open the getting started Wizard" when the installation is finished. This is not what we need since this is the Wizard for DirectAccess and VPN.  <br>
- So instead, we will close this window:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/55c45e47-a851-4fa1-a129-7ac5db93c5c7">
</p>  <br>

___

> [!NOTE]  
> *I will not be covering IIS/Web Server configuration and leave all to default.*

___

- Instead, to configure routing, we will go to "Tools" in the Server Manager UI and select "Routing and Remote Access":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/32a6d4ac-1622-4d76-93b1-400556d5df8e">
</p>  <br>

___

> [!NOTE]  
> *If you can't see the relevant tool, close the Server Manager UI and re-open it (as many times as needed) - Cheers Microsoft.*

___

- In the Routing and Remote Access Window, on the left, we can see our SRV1, which has a red icon, meaning it's not configured or running yet.  <br>
- Right-click SRV1 and select "Configure and enable routing and remote access".  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/e525af60-b927-4f64-8a8d-7e40ee36bf42">
</p>  <br>

- In this Wizard, we will reach the configuration page.  <br>
- Here, we will select "Custom Configuration":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/3090680a-3c6f-41c3-861f-c8d84e4e8ec8">
</p>  <br>

- On the next page. The Wizard is asking to select which features we'd like to configure.  <br>
- We will Select both NAT and LAN routing.  <br>
  * **NAT:** Because we want to configure this service on our WAN NIC.  <br>
  * **LAN Routing:** Because we want to configure this service on our LAN NIC.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/d316de2f-8b26-4655-8055-3e8a2478a9db">
</p>  <br>

- Once finished, Start the service when prompted, and you will see the updated window:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/abc3ee79-d065-466d-b327-d4b13af18797">
</p>

___

- We'll start off by configuring the NAT.  <br>
- Right-Click "NAT" in the Routing and Remote Access window and select "New Interface...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93e306df-c1da-4c3b-af1c-b775ff4c6b5d">
</p>  <br>

- A window that requires selecting which physical interface to work with will open. Select the "WAN" interface:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/7f98939d-202a-4411-bea3-380e43ac9897">
</p>  <br>

- In the next window, Configure this WAN interface as "Public" and enable "NAT":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/b8f124fb-dea0-4a29-8bad-ccd0b270b982">
</p>  <br>

- Your domain should be able to access the internet from this interface now.

___

- The interface will be added to the "NAT" list. Now, let's test the connection and see if we can generate some packets:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/04efff32-b4b5-48e9-a958-264d9e3b79de">
</p>

- First, let's configure both of our DCs default-gateway to point to this interface:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/5f40b013-e4ef-4263-9592-bf9db3cefec9" hspace="5">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/3419483f-f724-4cbd-af50-d923e66d1370" hspace="5">
</p>

<div align="center">
  
|[☝️ Back to top ☝️](#-%EF%B8%8F-configuring-routing--pat-on-srv1-%EF%B8%8F)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

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

<div align="center">
  
  | **Component** | **Description** |
  |---|---|
  | **Forest 🎄:** | A collection of one or more domains that share a common schema, configuration, and global catalog. Forests are the highest level of organization in Active Directory. |
  | **Domain 🚫:** | A logical grouping of objects within Active Directory. Domains define administrative boundaries and security boundaries within a forest. |
  | **FSMO Roles 🧻:** | Specialized roles that manage specific operations within Active Directory. |
  | **Containers 🏬:** | A basic (Default) Organizational Unit for grouping objects within Active Directory. |
  | **Organizational Unit 🥡:** | A specialized container that allows for a more granular organization of objects.|
  | **Objects 🧑‍💼:** | a basic unit representing various resources like users, groups, computers, etc. Objects have unique properties and attributes organized within the directory structure. |

</div>
  
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
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c02e5247-7ccb-4b52-bd29-d8830aeb9843">
</p>  <br>

___

> [!NOTE]  
> *There are many use cases out there, of course. These are just examples.*

___

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

  | 🔭 Group Scope 🔭 | 📔 Description 📔 |
  | ------------------ | ----------------- |
  | **Domain local** | for resource access within one domain.|
  | **Global** | for users and groups within one domain.|
  | **Universal** | for resource access across domains in a forest.|

| 👯‍♂️ Group Type 👯‍♂️ | 📔 Description 📔 |
| ----------------- | ----------------- |
| **Security** | for security-related purposes, such as granting access permissions.|
| **Distribution** | for sending email and organizing users for non-security purposes like distribution lists.|
<br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/299eaee1-8d49-40da-91cc-3cd50bd5b15c"><br>
</p>

___

> [!NOTE]  
> *I selected "Global" and "Security" for my use case since I want to configure permissions and access policies for this group later on in the project.*

___

- Now that we have our new group, let's add our Sales users to it:  <br>
  * Select all the desired users.  <br>
  * Right-click > select "Add to group..."  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/00d9c978-d0f5-4a0d-bc7b-fd4d97ef590f">
</p>  <br>

  * A window pops-up asking you to search for the desired group:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/4a68aa36-e1bb-431d-98ee-0bcf1f217f36">
</p>  <br>

  * We can confirm this by going to a user's properties and navigating to the "Member of" Tab:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/148fbe87-6534-4a33-b2cc-0d4df161636b">
</p>

___

- Now, let's take the same steps on our SysAdmin OU.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9d74f819-cf05-4518-9c15-8a987e25d6a1">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/1ae1f15b-c0b2-462a-be5f-0d701e180448">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/28f2469d-f7d4-4647-9703-ff36a3c055f2">
</p>  <br>

- It also makes perfect sense to add these users to the Domain Admins group (Since they're SysAdmin, right?):

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/04d24102-f20b-4b54-8b84-b0ab924c7829">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/02f33598-eb05-4789-85c3-713be02ff636">
</p>

___

- Let's check if the users we created are functioning correctly and if their relevant information is correct:
  * Remember the Windows 10 Pro we added to the domain earlier when setting up the lab environment? Well, let's fire it up.
___

<h3>🏭 Creating OUs, Users & Groups Using CMD 🏭</h3>

<p align="center">
  <strong>😨 "But I already have the GUI!" 😨</strong>  <br>
  <p align="justify">
    <em>True, but Imagine getting a task of creating 40, 50, or 200 users. That's time-consuming. Creating objects using CMD in AD is valuable for efficient bulk operations, automated provisioning, and scripting. It's handy when adding multiple users, groups, or other objects with consistent attributes, reducing manual effort and ensuring accuracy. CMD scripts can streamline repetitive tasks, such as onboarding new employees or managing group memberships, improving administrative efficiency, and maintaining a consistent directory environment.</em>
  </p>
</p>

___

- We will first demo creating two users with the following command-line tool: <code><strong>DSADD</strong></code>  <br>
- Here's a table that describes what each of the DSADD tools can do:  <br>

| Command | Description |
| ------- | ----------- |
| DSADD computer | Adds a single computer to the directory.|
| DSADD contact | Adds a single contact to the directory.|
| DSADD group | Adds a single group to the directory.|
| DSADD OU | Adds a single organizational unit to the directory.|
| DSADD user | Adds a single user to the directory.|
| DSADD quota | Adds a quota specification to a directory partition.|

- You can use <code><strong>DSADD /?</strong></code> or <code><strong> DSADD user /?</strong></code> to check what syntax follows each tool.

<p align="center">
  <a href="https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc753708(v=ws.11)">👉 Here's more info on DSADD 👈</a>
</p>

> [!NOTE]  
> *I will demonstrate elements crucial to creating an account, as there are many options in the tool itself on how to customize the user or add more information about the account.*

___

- We will start off by manually running DSADD commands so we can get familiar with them.
- 

<div align="center">
  
|[☝️ Back to top ☝️](#-%EF%B8%8F-active-directoy-users--computers-management-%EF%B8%8F-)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/assets/132819728/4180ad20-43f5-4584-9132-a2bfd2ebfcbe)

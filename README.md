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
  <li><a href="#-%EF%B8%8F-topology-%EF%B8%8F-"> <strong>Topology</strong></a></li>
  <li><a href="#--introduction--"> <strong>Introduction</strong></a></li>
  <li><a href="#--requirements-for-the-lab-environment--"> <strong>Requirements for the lab environment</strong></a></li>
  <li><a href="#-%EF%B8%8F-setting-up-the-lab-environment-%EF%B8%8F-"> <strong>Setting up the lab environment</strong></a></li>
  <li><details open="open">
    <summary><a href="#--creating--configuring-a-domain-controller--"> <strong>Creating & Configuring a Domain Controller</strong></a></summary>
    <ol>
      <li><a href="#--creating-server-roles-"> <em> Creating Server Roles</em></a></li>
      <li><a href="#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-"> <em> Configuring our 1st Domain Controller</em></a></li>
      <li><a href="#-initial-security-step-"> <em> Intial Security Step</em></a></li>
      <li><a href="#-adding-a-secondary-domain-controller-dc2"> <em> Adding a Secondary Domain Controller (DC2)</em></a></li>
      <li><a href="#-configure-dc2-as-the-rid-master-"> <em> Configure DC2 as the RID Master</em></a></li>
    </ol>
  </details></li>
  <li><details open="open">
    <summary><a href="#--dhcp-configuration--"> <strong>DHCP Configuration</strong></a></summary>
    <ol>
      <li><a href="#-pre-requesite-steps-"> <em>Pre-requisite Steps</em></a></li>
      <li><a href="#-configuring-a-dhcp-scope-"> <em>Configuring a DHCP Scope</em></a></li>
      <li><a href="#-testing-our-dhcp-scope-"> <em>Testing our DHCP Scope</em></a></li>
      <li><a href="#-configuring-a-failover-cluster-"> <em>Configuring a Failover Cluster</em></a></li>
    </ol>
  </details></li>
  <li><details open="open">
    <summary><a href="#-%EF%B8%8F-configuring-routing--pat-on-srv1-%EF%B8%8F"> <strong>Configuring Routing & PAT on SRV1</strong></a></summary>
      <ol>
        <li><a href="#-pre-requisite-steps-"> <em>Pre-requisite Steps</em></a></li>
        <li><a href="#%EF%B8%8F-installing--configuring-routing--remote-access-services-rras-%EF%B8%8F"><em> Configuring Routing & Remote Access Services (RRAS)</em></a></li>
      </ol>
  </details></li>
  <li><details open="open">
    <summary><a href="#-%EF%B8%8F-active-directoy-users--computers-management-%EF%B8%8F-"> <strong>Active Directory Users & Computers Management</strong></a></summary>
    <ol>
      <li><a href="#-the-aduc-gui-"> <em> The ADUC GUI</em></a></li>
      <li><a href="#creating-ous-users--groups-using-the-gui"> <em> Creating OUs, Users & Groups Using the GUI</em></a></li>
      <li><a href="#-creating-ous-users--groups-using-cmd-"> <em> Creating OUs, Users & Groups Using CMD</em></a></li>
      <li><a href="#-bulk-object-creation-using-a-batch-script-"> <em> Bulk Object Creation Using a Batch Script</em></a></li>
      <li><a href="#-creating-ous-users--groups-using-powershell--"> <em> Creating OUs, Users & Groups using PowerShell</em></a></li>
      <li><a href="#-bulk-object-creation-using-a-powershell-script-"> <em> Bulk Object Creation Using a PowerShell Script</em></a></li>
      <li><a href="#-testing-replication-and-user-login-"> <em> Testing Replication and User Login</em></a></li>
    </ol>
  </details></li>
</ol>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🚪 Introduction 🚪 </h2>

<p align="justify">
Welcome to my Active Directory Project, culminating my studies in the Microsoft Server (MCSA) and Cybersecurity courses at See-Security College. This project showcases a network infrastructure design in-depth, focusing on Microsoft's Active Directory technology. I've configured key components within this virtual environment, including Domain Controllers, DNS, DHCP, Routing, FTP, Group Policies, user management, security protocols, and remote access solutions. This project underscores my knowledge of Microsoft technologies and network security principles, emphasizing the important role of a well-structured directory service in organizational management.
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
    👉 You can check this link here for a guide 👈</a>
</p>

___

- We will start by setting up the lab environment in 5 VMs. It will Consist of 2 Domain Controllers, a routing server, and two Windows 10 Pro clients.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-1.png"> 
</p>  <br>

- It is essential that each virtual machine is configured to NAT.  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-2.png" height="500px" width="auto">
</p>  <br>

> [!NOTE]  
> <em>I have disabled Vmware DHCP services because I'm going to create my own DHCP service from the Active Directory services.</em>

___

- Begin installing the OSs individually, and then we will do some basic set up for both DCs and SRV-1 (basic networking settings).  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-3.png"> 
</p>  <br>

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
</p>  <br>

> [!NOTE]  
> *The reason that the "Host" portion of the IP address is "3" and not "1" or "2" is because these two "Host" addresses are reserved for NAT operation by VMware*

  <p align="center">
    <a href="https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-144D22BA-298E-4293-8137-B631AD7BF694.html">
      <em>👉 Here's more details on the subject 👈</em></a>
  </p>

___

- Change the Computer Name (And don't add a Domain Just yet since we didn't create a Domain-Controller):  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-6.png" height="auto" width="500px">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Setting-up-the-lab-environment-7.png" height="auto" width="500px">
</p>  <br>

> [!NOTE]  
> *Restart, and repeat the same steps in DC2 and SRV1 (with different host IPs).*

<div align="center">
  
|[☝️ Back to top ☝️](#-%EF%B8%8F-setting-up-the-lab-environment-%EF%B8%8F-)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>
  
![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🤔 Creating & Configuring a Domain Controller 🤔 </h2>

<p align="center">
  <p align="justify">
    <em>In this section, we will explore the steps needed to create Two DCs (I will explain the rationale during setup) and explain briefly about the features and options that will be encountered.</em>
  </p>
</p>  <br>

<strong>Here are the topics that we're going to cover:</strong>  <br>

| |
|---|
|[1. Creating Server Roles ▶️](#--creating-server-roles-)|
|[2. Configuring our 1st Domain Controller ▶️](#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-)|
|[3. Intial Security Step ▶️](#-initial-security-step-)|
|[4. Adding a Secondary Domain Controller (DC2) ▶️](#-adding-a-secondary-domain-controller-dc2)|
|[5. Configure DC2 as the RID Master ▶️](#-configure-dc2-as-the-rid-master-)|

___

<h3> 🧻 Creating Server Roles 🧻</h3>

- The first step to creating a domain is to create a DC. For that, we will go to Server Manager > Manage and add Roles and Features  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-1.png"> 
</p>  <br>

- In the wizard 🪄, we must choose between "Role-based or feature-based installation" and "Remote Desktop Services installation".  <br>
- To install a new DC, select "Role-based or feature-based installation"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-2.png">
</p>  <br>

<p align="center">
  <strong>😨 What is the difference? 😨</strong>
  <p align="justify"> 
    <em>Role-based/feature-based configures the server's core roles and optional features to provide fundamental services in your environment. Remote Desktop Services, on the other hand, is specifically focused on enabling remote desktop access and application delivery for multiple users. In an AD environment, you might use role-based/feature-based installation to set up services like Domain Controllers, DNS, and DHCP. Afterward, if you need to provide remote desktop access to users, you would install the RDS role separately.</em>
  </p>
</p>

___

- The next step is to select the server from the pool:  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-3.png">
</p>  <br>

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
</p>  <br>

> [!NOTE]  
> *We will skip the "Features" page since we already selected all the features for the corresponding Server Roles we added.*

___

- Then we will reach the "Confirmation" page and hit "Install"  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-5.png">
</p>

> [!NOTE]  
> *We will not need to check the "Restart..." box since this is a local Server.*

___

- Once the wizard is done installing, you are given the option to "Promote this server to a domain controller":  <br>

<p align="center"> 
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Server-Roles-6.png">
</p>

> [!NOTE]  
> *if you reach this point and hit "Close" instead of "Promote this server to a domain controller", then there's no need to panic. On the top right of the Server Manager UI, you will see a flag with ⚠️ on it. When clicking on it, you will see the tasks that must be completed. Among them is Promoting the server*

___

<h3> ☣️ Configuring our 1st Domain Controller ☣️ </h3>

- We must select the "Add a new forest" operation for the first deployment.  <br>
- Then specify the "Root Domain Name". In my case, it will be "mustafa.com".  <br>

  <p align="center"> 
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-1.png">
  </p>

<p align="center">
  <strong>😨 Why Did I select "Add a new forest"? 😨</strong>
  <p align="justify">
    <em> Selecting "Add a new forest" when deploying a DC for the first time is necessary when establishing a new AD environment. It allows you to create the foundation for your directory structure, set forest-wide settings, and maintain administrative autonomy over your network.</em></p>
</p>

___

- For the DC options, we will need to select the following settings:  <br>
  * Forest & Domain Functional level: Since we will use the same OS on all servers, the latest.  <br>
  * ✔️ the DNS since we will require it for configuring a DNS on this DC.  <br>
  * ✔️ the Global Catalog to replicate objects between DC1 and DC2. Follow this <a href="https://learn.microsoft.com/en-us/windows/win32/ad/global-catalog">link</a> to understand GC functionality.  <br>
  * We <strong>do not</strong> select "RODC". This is reserved for DCs that we don't want its info changed/tampered with.  <br>
  * We are required to enter a DSRM password for catastrophes. Check this <a href="https://en.wikipedia.org/wiki/Directory_Services_Restore_Mode">link</a> for more info.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-2.png">
  </p>

- I will skip the DNS options since we will not cover DNS delegation in this step.  <br>
- In the Additional Options page, the NetBIOS domain name will automatically generate from the domain name we specified. <a href="http://www.differencebetween.net/technology/internet/difference-between-dns-and-netbios/">Here's more info on NetBIOS</a>.  <br>
- In the "Paths" page, we can see and edit the default folders for:  <br>
  * Database: NTDS is a critical component of the AD infrastructure, housing the information on directory information.  <br>
  * Log files: Log files associated with the AD database.  <br>
  * SYSVOL: Stores and distributes Group Policy objects and other system-level settings (Scripts, for example) across all DCs.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-3.png">
</p>

___

- Lastly, we will reach the "Review Options" page, where we can review all the configurations we did.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-4.png">
</p>

> [!NOTE]  
> *If you haven't yet configured a local Admin password when installing the VM, you will run into this error in the Prerequisites Check page.*

___

- The way to remedy this is to add a local admin password using <a href="https://www.top-password.com/knowledge/change-windows-10-password.html">any of these simple methods</a>.
- Once the password is updated, we hit the "Rerun prerequisites check" link and can see that there are no errors:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Configuring-domain-controller-5.png">  <br>
</p>

- If you're cleared to proceed, you can hit "Install". This will install AD-DS & DNS and restart the system.  <br>
- Once restarted, you will be asked to enter the domain using your previously configured local admin password.

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

<p align="center">
  <strong>😨 Why did I do that? 😨</strong>  <br>
  <p align="justify">
  <em>When creating a DC, it's recommended to duplicate the default Administrator, assign the new copy a distinct name, and disable the original Administrator. This precaution is taken because the default Administrator, which is present in every Windows installation, has a well-known Security Identifier (SID) suffix. The SID is a unique identifier associated with user accounts, and a widely recognized SID could potentially expose the domain to security risks. By renaming and disabling the default Administrator, you obscure its SID, making it less predictable to potential attackers.</em>
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

  * If we break down every section of the SID, we will find that it's similar across all accounts except the suffix:  <br>
  * **S-1-5**: SID version information (fixed)  <br>
  * **21-1869958264-2762823925-4193717463**: Domain Identifier (Fixed for users in the same domain)  <br>
  * **500**: Relative ID (RID), which identifies the specific user; default users in the active directory always start at **500**  <br>

> [!NOTE]  
> *Any other user created by our <a href="https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/d142a27c-65fb-49c9-9e4b-6ede5f226c8a">RID Master</a> will begin at 1000.*

___

<p align="center">
  <strong>🚨 Now Imagine this scenario 🚨</strong>  <br>
  <p align="justify">
    <em>An unauthorized access occurs on one of your users (be it outside or inside the network/domain), and that threat actor types this command:</em> <code><strong>whoami /user</strong></code><em>. This will be his output. One can use this output to get more information about the domain and try to escalate privileges to an Admin level to gain more control of the system</em>
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
    <em>Yes!! Adding a secondary DC ensures high availability, data redundancy, improved performance, and security in an AD environment. While a forest can technically function with just one DC, the recommended practice is to deploy at least two DCs to prevent disruptions caused by hardware failures or maintenance, maintain data integrity, distribute the load, and facilitate efficient management and updates. Relying on a single DC is discouraged due to the potential risks associated with a single point of failure.</em>
  </p>
</p>

___

- we'll start by first adding the DC2 VM to our newly established domain:  <br>
  * Go to Server Manager on DC2  <br>
  * Switch to the Local Server Page  <br>
  * Click on either "Computer name" or "Workgroup"  <br>
  * Click on change  <br>
  * Select "Domain" and add your domain.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-1.png">
</p>  <br>

- Notice that when clicking "OK" we run into the following error:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-2.png">
</p>  <br>

- The reason is that our DC DNS properties are pointing to VMware's DNS Service.  <br>
- We will need to configure our DC2 to point to DC1 DNS instead:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-3.png">
</p>  <br>

- Once we insert the DNS of our DC1 and try again, we will be prompted to enter domain Admin credentials:  <br>

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
> *Now you have the option to manage DC2 from DC1. This is especially helpful when you're using a server core OS.*

___

- We will go through the same<a href="#-%EF%B8%8F-configuring-our-1st-domain-controller-%EF%B8%8F-"> exact steps as DC1</a>, but I will highlight the differences here:  <br>
  * For the "Server Roles", we will add AD-DS, a secondary DNS, and a File-Server role.  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-6.png">
  </p>  <br>

  * Once the Roles are installed. We will "Promote this server to a domain controller" much like before.  <br>
  * We will need to add our DC2 to an existing domain (since we already have one) and specify it:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-7.png">
  </p>  <br>

  * For "DC options" we will maintain the default values and add the previously created DSRM password:  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-8.png">
  </p>  <br>

  * In the "Additional Options" page, we will specify the DC to replicate from any domain controller in the domain (In this case it's DC1)  <br>
  
  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-9.png">
  </p>  <br>

  * Paths will be maintained as default.  <br>
  * After reviewing everything, we will continue to the "Prerequisites Check".  <br>
  * If the Prerequisite Check is successful, hit install, and the Server will reboot.
 
___

- Once the server is rebooted, we will notice that it's no longer in the Domain:  <br>

  <p align="center">
    <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/2nd-domain-controller-10.png">
  </p>  <br>

- This is because 🥁<em>DRUM ROLL...</em>🥁 DNS!!  <br>
- Same as we did earlier, we will need to reconfigure the DNS to point to DC1 instead of DC2 as the preferred and to DC2 as the alternative:  <br>
  
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
    <em>RID (Relative Identifier) is a crucial Flexible Single Master Operations (FSMO) role in a domain. Its primary function is to allocate unique Relative Identifiers (RID) to each domain controller. These RIDs create Security Identifiers (SIDs) for objects like users and groups. Ensuring the uniqueness of SIDs is essential for security and data integrity in AD. The RID Master is responsible for preventing conflicts and maintaining globally unique SIDs within the domain. In a multi-domain forest, each domain has its own RID Master, and this role can be transferred if necessary.</em>
  </p>
</p>

<p align="center">
  <strong>😨 FSMO?? 😨</strong>  <br>
  <p align="justify">
    <em>FSMO roles are responsible for various administrative functions. Five FSMO roles exist in a forest: the Schema Master, Domain Naming Master, Infrastructure Master, RID Master, and PDC Emulator. Each role has a specific purpose: managing schema updates, domain naming, handling RID allocation, and time synchronization. FSMO roles ensure the proper functioning and integrity of the AD structure. some roles are forest-wide (Schema Master and Domain Naming Master), and others are per-domain (RID Master, Infrastructure Master, and PDC Emulator). FSMO roles can be transferred or seized if needed.</em>
  </p>
</p>

___

- In DC2, navigate to "Active Directory Users and Computers".  <br>
- Right-click the domain name and select "Operations Masters".  <br>
- A window displays information about All the Domain Roles (RID, PDC, Infrastructure).  <br>
- We will select "RID" and click "change" to transfer the role from DC1 to DC2.  <br>

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
    <em>Dynamic Host Configuration Protocol is a network service used in MS Servers to automatically assign IP addresses and related network configuration settings to devices on a network. Its primary use case is to simplify IP address management, making deploying and managing devices in a network easier. DHCP ensures that each device on the network receives a unique IP address, subnet mask, default gateway, DNS, and other parameters. Reducing the administrative overhead of manually configuring each device.</em>
  </p>
</p>

<strong>Here are the topics that we're going to cover:</strong>  <br>

| |
|---|
|[1. Pre-requisite Steps ▶️](#-pre-requesite-steps-)|
|[2. Configuring a DHCP Scope ▶️](#-configuring-a-dhcp-scope-)|
|[3. Testing our DHCP Scope ▶️](#-testing-our-dhcp-scope-)|
|[4. Configuring a Failover Cluster ▶️](#-configuring-a-failover-cluster-)|

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

- We will create a new <strong><a href="https://learn.microsoft.com/en-us/windows-server/networking/technologies/dhcp/dhcp-scopes">DHCP Scope</a></strong> and customize its settings to match our domain needs.  <br>
- The first step is to go to "Tools" > "DHCP":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-1.png">
</p>  <br>

- We will configure a new DHCP scope by right-clicking "IPv4" > "New Scope...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-2.png">
</p>  <br>

- This will open an installation window, where we specify the scope name and description:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-3.png">
</p>  <br>

- I will configure the DHCP scope to lease 50 addresses in total for my domain:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-4.png">
</p>

> [!NOTE]  
> *Your Start/End addresses will be different according to the subnet you're in and your use case*

___

- I will be excluding the first 5 addresses from the scope. This will bring the total down to 45 addresses:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-5.png"><br>
  <strong>😨 "What is the purpose of address exclusion?" 😨</strong>  <br>
  <p align="justify">
    <em>It ensures that these addresses are not automatically assigned to client devices. Exclusion is typically used for devices with statically configured IP addresses, such as servers, routers, or printers, ensuring that the DHCP server does not allocate these addresses to other devices. Exclusion helps maintain network stability, preventing IP address conflicts and ensuring that critical network resources always have their designated addresses available for use.</em>
  </p>
</p>

___

- Then we will define the Lease Duration, which will be 8 hours:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-6.png"><br>
  <strong>😨 "What is the purpose of Lease Duration?" 😨</strong>  <br>
  <p align="justify">
    <em>It specifies how long a device can use the IP information provided. Its purpose is to manage address allocation, adapt to changing network needs, facilitate IP address reclamation, support load balancing, and enhance network security. The choice of lease duration depends on network requirements, balancing address management efficiency, network stability, and security considerations. Shorter leases suit devices with frequent connections, while longer leases are suitable for stable connections and resource planning.</em>
  </p>
</p>

___

- Now we will define the DHCP options (which I'll explain shortly).  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-DHCP-scope-7.png">  <br>
  <strong>😨 "So what are DHCP options?" 😨</strong>  <br>
  <p align="justify">
    <em>They are additional parameters that a DHCP can provide to devices alongside the essential IP address and subnet mask. These options include settings such as the default gateway, DNS server addresses, domain names, time servers, and more.</em>
  </p>
</p>

___

- The first step is to define our default gateway address. I will not specify the VMware NAT. Instead, I will add the address of SRV1. If you look back at our <a href="#-%EF%B8%8F-topology-%EF%B8%8F-">Topology</a> You can see that we will be configuring SRV1 as a routing server.  <br>

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
- As soon as we log into the OS, we are automatically assigned our IP information from the DHCP:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/testing-dhcp-scope-1.png">
</p>  <br>

- And if we check using <code><strong>ipconfig /all</strong></code>:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/testing-dhcp-scope-2.png">
</p>  <br>

- Here, we can see all the parameters we previously configured:  <br>
  * IP address which took the suffix "26", which means our exclusion rule worked ✔️  <br>
  * The lease that expires in 8 hours ✔️  <br>
  * The default-Gateway which is SRV1 ✔️  <br>
  * The DHCP Server, which is DC1 ✔️  <br>
  * The DNS servers, which is both DC1 and DC2 ✔️  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/testing-dhcp-scope-2.png">
</p>  <br>

___

- We will add this PC to our domain.  <br>
- Go to "Settings" > "System" > "About" and select "Advanced System Settings":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9c47c0b2-3bce-4572-bf69-a3990bbfc9fe">
</p>  <br>

- Then Switch to the "Computer Name" tab and select "Change...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/93a72d84-eee7-4820-884f-dceb50b656a0">
</p>  <br>

- Add the domain name and select "Ok":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8c064c8c-43ed-4dff-a6ca-a66cb0c4272c">
</p>  <br>

- You will need to input a domain admin's credentials to proceed and then restart the computer.  <br>
- Once the computer restarts, you can use domain user credentials to log in.  <br>
- We can verify that Windows 10 is connected to the domain by pinging our DCs:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/testing-dhcp-scope-3.png">
</p>

___

<h3>🚧 Configuring a Failover Cluster 🚧</h3>

<p align="center">
  <strong>😨 "A Failover Cluster?! I thought we were done with DHCP!" 😨</strong>  <br>
  <p align="justify">
    <em> Yeah, sure. You can stop here... Why would you need a Failover Cluster?... BAM! Your DC1 decided it's taking a holiday, along with its DHCP server to the digital Caribbean, In 8 hours, all of your DHCP clients are going to end their lease and lose their IP information. Do you think you have the wits to fix this in less than 8 hours? at midnight? oh, you forgot the keys? you're having a gut-wrenching diarrhea? Can you survive all the human factors and restore stability to your organization before all hell breaks loose?</em>
  </p>
</p>

<p align="center">
  <strong>😨 "I get your point. What is a Failover Cluster, then?" 😨</strong>  <br>
  <p align="justify">
    <em>It ensures high availability and load balancing for DHCP services, improving network reliability. In Load Balance mode, both servers share the DHCP client load, while in Hot Standby mode, one server is active while the other is on standby, ready to take over if the active server fails. This setup helps prevent DHCP service interruptions.</em>
  </p>
</p>

___

- The first step is to create a DHCP server role in DC2 using the same steps we took when we <a href="#--creating-server-roles-">configured a DHCP server on DC1</a>; By selecting the DHCP server role and adding it's features.  <br>
- Now that we're done with the initial configuration, we will move to DC1 DHCP tools.  <br>
- We will right-click "IPv4" again and select "Configure Failover..."  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-1.png">
</p>  <br>

- In the installation wizard, select the scope to configure the failover for.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-2.png">
</p>  <br>

- Next, we're we specify the server we want as a Failover DHCP. Select "Add Server" and add DC2 as the Partner Server and click Next:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-3.png">
</p>  <br>

> [!NOTE]  
> *If you don't see DC2 in the "Authorized DHCP Servers", you should refresh the Server Manager UI.*

___

- The next page is where we lay out the details of the Failover Relationship:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-4.png">
</p>  <br>

- Here's a detailed explanation of each Parameter and their use cases:  <br>

| Parameter | Description |
| --------- | ----------- |
| <strong>Relationship Name</strong> | Assign a unique name to identify the failover relationship. |
| <strong>Maximum Client Lead Time</strong> | Specifies the maximum time by which a client can extend its lease beyond the duration offered by the failed DHCP. |
| <strong>Mode</strong> | <ul><li><strong>Load Balance:</strong> Both servers actively serve DHCP clients, sharing the load.</li><li><strong>Hot Standby:</strong> One server is active, and the other is on standby. The standby server only takes over the DHCP service if the active server fails.</li></ul>|
| <strong>Addresses Reserved for Standby Server</strong> | You can specify a pool of IP addresses that will be reserved. This is useful for maintaining a pool of unused addresses for failover situations.|
| <strong>State Switchover Interval</strong> | It represents the interval at which the roles of the two DHCP servers in a relationship switch between the primary and secondary DHCP servers in Load-Balance mode. |
| <strong>Enable Message Authentication</strong> | Authentication of information exchanged between the DHCP servers in a failover relationship. It ensures that the data transmitted between the servers are secure and have not been tampered with during transmission.|
| <strong>Shared Secret</strong> | A secret key shared only between both servers to communicate securely - Required if Message Authentication is Enabled.|

- The last page shows a review of your configuration to confirm and apply, click "Finish".  <br>
- Once you click "Finish" a log window will pop up to show you the progress of installing the failover configuration:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-5.png">
</p>  <br>

- We can confirm this by checking the description of the Scope we created at the beginning and see that the failover relationship was applied:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/configuring-failover-cluster-6.png">
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
    <em>Port Address Translation enables multiple devices within a private network to share a single public IP address. It achieves this by mapping different private IP addresses and port numbers to a single public IP address and port number, facilitating efficient internet access for multiple devices while conserving public IP addresses. We're essentially converting SRV1 into a router for our domain.</em>
  </p>
</p>

<p align="center">
  <strong>😨 "What are the use cases? You already have VMware NAT"</strong>
  <p align="justify">
    <em> Using a Windows Server as a router is advantageous in scenarios where integration with the Windows environment, centralized management, limited budget or resources, testing, and development, or customization and scripting are priorities. It can simplify management within a Windows ecosystem and be cost-effective in smaller environments. However, traditional routers and networking hardware outperform Windows Servers regarding performance and reliability. VMware NAT, on the other hand, lacks the level of control found in a Windows Server. In a dedicated PAT Windows Server, you can activate <a href="https://docs.netscaler.com/en-us/citrix-sd-wan/current-release/dhcp-server-and-dhcp-relay.html#:~:text=A%20DHCP%20relay%20agent%20is,and%20a%20remote%20DHCP%20Server.">DHCP Relay Agent</a>, Enable packet capture and analysis, and create firewall policies in the PAT Server. Capabilities which are not found in VMware NAT.</em>
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-1.png">
</p>  <br>

- Then we will select and add a "Network Adapter":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-2.png">
</p>  <br>

- And make sure that this new adapter is configured to "Bridged" Since this NIC will be facing our internal network:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-3.png">
</p>  <br>

- Once that's done, we can see both NICs on the "Network Connections" page:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-4.png">
</p>  <br>

- But how can we identify which NIC is internal and which is external?  <br>
- Luckily, we already configured our external NIC to the VMware NAT.  <br>
- Double-click one of the NICs and select "Details..."  <br>
- If you check the Default Gateway, you'll find the ".2" suffix, the VMware NAT:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-5.png">
</p>  <br>

- We will also change the IP address of this NIC, since we will be using the ".5" suffix for our SRV1 Router:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-6.png">
</p>  <br>

- This is our External NIC. Let's call it "WAN" and the other NIC will be "LAN": <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-7.png">
</p>  <br>

- We will also change the IPv4 information of our LAN NIC:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-8.png"><br>
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-9.png">
</p>  <br>

- Like we previously did with our DCs, we will select the "Computer Name" in the Server Manager UI:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-10.png">
</p>  <br>

- Select "Change..." > Domain > Add your domain name.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/route-pre-requisite-steps-11.png">
</p>  <br>

- Once you confirm your settings, a window will pop up asking for Domain credentials.
- The server will restart and enter the domain.


___

<h3>🛠️ Installing & Configuring Routing & Remote Access Services (RRAS) 🛠️</h3>

- Now that we're done with the prerequisites, let's dive into creating the actual RRAS Server on our Windows Server Machine.  <br>
- We will begin by going to Manage > Selecting "Add Roles and Features".  <br>
- Select "Role-based or feature-based installation".  <br>
- Select our SRV1 from the server pool like we did with our DCs.  <br>
- In the "Server Roles" Tab, we will scroll down and select the "Remote Access" role:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-1.png">
</p>  <br>

- We will not change anything with the features.  <br>
- Once we get to the Role Services tab, we will need to select "Routing":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-2.png"><br>
  <strong>😨 "Why did "DirectAccess and VPN (RAS)" get automatically selected?!" 😨</strong><br>
  <p align="justify">
    <em>The role is mandatory when selecting "Routing" because routing and VPN services are closely linked. Routing often involves secure data transfer between networks, where VPNs play a crucial role. This bundled setup simplifies configuration and caters to common scenarios where both routing and VPN services are needed, offering flexibility to enable or disable specific features based on your requirements during setup.</em>
  </p>
</p>  <br>

- Once we confirm our selection, we will select Next until we reach the confirmation tab and install the Role.  <br>

- We will not select the "Open the getting started Wizard" when the installation is finished. This is not what we need since this is the Wizard for DirectAccess and VPN.  <br>
- So instead, we will close this window:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-3.png">
</p>  <br>

> [!NOTE]  
> *I will not be covering IIS/Web Server configuration and leave all to default.*

___

- Instead, to configure routing, we will go to "Tools" in the Server Manager UI and select "Routing and Remote Access":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-4.png">
</p>  <br>

> [!NOTE]  
> *If you can't see the relevant tool, close the Server Manager UI and re-open it (as many times as needed) - Cheers Microsoft.*

___

- In the Routing and Remote Access Window, on the left, we can see our SRV1, which has a red icon, meaning it's not configured or running yet.  <br>
- Right-click SRV1 and select "Configure and enable routing and remote access".  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-5.png">
</p>  <br>

- In this Wizard, we will reach the configuration page.  <br>
- Here, we will select "Custom Configuration":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-6.png">
</p>  <br>

- On the next page. The Wizard is asking to select which features we'd like to configure.  <br>
- We will Select both NAT and LAN routing.  <br>
  * **NAT:** Because we want to configure this service on our WAN NIC.  <br>
  * **LAN Routing:** Because we want to configure this service on our LAN NIC.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-7.png">
</p>  <br>

- Once finished, Start the service when prompted, and you will see the updated window:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-8.png">
</p>

___

- We'll start off by configuring the NAT.  <br>
- Right-click "NAT" in the Routing and Remote Access window and select "New Interface...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-9.png">
</p>  <br>

- A window that requires selecting which physical interface to work with will open. Select the "WAN" interface:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-10.png">
</p>  <br>

- In the next window, Configure this WAN interface as "Public" and enable "NAT":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-11.png">
</p>  <br>

- Your domain should be able to access the internet from this interface now.

___

- The interface will be added to the "NAT" list. Now, let's test the connection and see if we can generate some packets:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-12.png">
</p>

- First, let's configure both of our DCs default-gateway to point to this interface:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-13.png" hspace="5">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/RRAS-14.png" hspace="5">
</p>

<div align="center">
  
|[☝️ Back to top ☝️](#-%EF%B8%8F-configuring-routing--pat-on-srv1-%EF%B8%8F)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

<h2 align="center"> 🎯 DNS Configuration 🎯 </h2>

<p align="center">
  <p align="justify">
    <em>For this part of our infrastructure setup for the Lab Environment, we will configure our Domain Name Service Servers (DNSs) which we installed previously on DC1 and DC2. We will look at setting up DNS forwarding, conditional forwarding, primary, secondary, stub-zones, CNAME configuration, and Round Robin. </em>
  </p>
</p>

<p align="center">
  <strong>😨 "What is DNS?" 😨</strong>
  <p align="justify">
    <em>DNS is a vital network service in Microsoft Server that converts user-friendly domain names into numerical IP addresses. This translation enables devices to locate and communicate with each other on the internet or within a local network. DNS is essential for domain management, resolving hostnames, supporting Active Directory, and ensuring smooth network communication in a Windows Server environment. It is fundamental for identifying network resources, streamlining administrative tasks, and enhancing server infrastructure functionality and reliability.</em>
  </p>
</p>

<p align="center">
  <a href="https://learn.microsoft.com/en-us/windows-server/networking/dns/dns-top">👉 Here's a more detailed explanation 👈</a>
</p>

___

<h3>🏣 Configuring External DNS Forwarding 🏣</h3>

<p align="center">
  <p align="justify">
    <em>External forwarding involves configuring the DNS server to route DNS queries for external domain names to external DNSs, typically provided by an ISP or a public DNS service like Google's 8.8.8.8. This configuration enables the internal DNS server to resolve external domain names by forwarding requests to the designated external DNS. It enhances DNS resolution, reduces the server's workload, and ensures internal clients can access internet resources.</em>
  </p>
</p>  <br>

<p align="center">
  <a href="https://learn.microsoft.com/en-us/windows-server/networking/dns/quickstart-install-configure-dns-server?tabs=powershell#configure-forwarders">👉 Here's more info on External Forwarding 👈</a>
</p>

___

- To add DNS external forwarding, we must go to the DNS tools UI in the Server Manager.  <br>
- At the top right corner, select "Tools" > then "DNS".  <br>
- In the DNS tools UI, right-click your DNS server and select "Properties":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/960b181b-49f4-4d6f-a28d-3d23d34f10f7">
</p>  <br>

- In the Properties window, navigate to the "Forwarders" tab and select "Edit...":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/df0d48df-9afa-4979-9619-eb968b91c265">
</p>  <br>

- In the "Edit Forwarders" window, add your desired external DNS. In this case, we're adding Google public DNS (8.8.8.8):  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/e71fa726-8c80-47a9-bf00-087f7e0856be">
</p>  <br>

- Now we can see that the Google public DNS was added as a forwarder in our DNS configuration:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/ee06f8de-1fd4-443c-bd00-94972910194b">
</p>

___



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
    <em>Active Directory Users & Computers (ADUC) is a management tool, serving as the primary interface for administering user accounts, groups, and computer objects in an AD environment. It allows administrators to create, modify, and manage user accounts, reset passwords, assign group memberships, organize objects into organizational units (OUs), and oversee domain-wide policies. ADUC also offers advanced features for managing security settings, group policies, and attributes of AD objects, making it an essential tool for maintaining a domain's security, organization, and functionality.</em>
  </p>
</p>

<strong>Here are the topics that we're going to cover:</strong>  <br>

| |
|---|
|[1. The ADUC GUI ▶️](#-the-aduc-gui-)|
|[2. Creating OUs, Users & Groups Using the GUI ▶️](#creating-ous-users--groups-using-the-gui)|
|[3. Creating OUs, Users & Groups Using CMD ▶️](#-creating-ous-users--groups-using-cmd-)|
|[4. Bulk Object Creation Using a Batch Script ▶️](#-bulk-object-creation-using-a-batch-script-)|
|[5. Creating OUs, Users & Groups using PowerShell ▶️](#-creating-ous-users--groups-using-powershell--)|
|[6. Bulk Object Creation Using a PowerShell Script ▶️](#-bulk-object-creation-using-a-powershell-script-)|
|[7. Testing Replication and User Login ▶️](#-testing-replication-and-user-login-)|

___

<h3>🐒 The ADUC GUI 🐒</h3>

- We will start off by going to ADUC (Tools > ADUC).  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/ADUCGUI-1.png">
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/ADUCGUI-2.png">
</p>

___

<h3>🏭 Creating OUs, Users & Groups Using the GUI 🏭</h3>

- To create new Organizational Units, you will need to take these steps:<br>
  * Right-click the domain you want to create the OUs on.
  * Select New > Organizational Unit.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-1.png">
</p>  <br>

  * A window will pop up asking you to input the OU name.
  * You will also have the option to select "Protect container from accidental deletion" - Which I recommend keeping.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-2.png"><br>
  <strong>"That Protect option sounds fancy. What does it do?"</strong><br>
  <em>When trying to delete the container, a window pops to ask, "Are you sure you'd like to get fired today?", you have the option to accept, but umm, well...</em><br>
  🦗 <a href="https://www.youtube.com/watch?v=CpGtBnVZLSk&ab_channel=GamingSoundFX"><strong>*Cricket Sounds*</strong></a> 🦗
</p>

  * Click "OK" and you have yourself a brand-new OU. Well, I created two.

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-3.png">
</p>

___

- Now, let's create new users in our OUs. Here are the needed steps:  <br>
- Select the designated OU.  <br>
- Right-click it, or it's empty directory.  <br>
- Select New > User  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-4.png">
</p>  <br>

- A window pops up so you can fill out basic info about the new user:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-5.png">
</p>  <br>

- Next, we will need to specify a password and its settings. They're self-explanatory, but let me go over their use case:  <br>
  1. **Change password at next logon:** recommended. First login passwords are easy and generic, making first logon easier for new users.  <br>
  2. **User cannot change password:** For services that require a fixed password. Or guests, where you have more control over their account.  <br>
  3. **Password never expires:** For services, Super-Administrative or critical users, and specialized accounts.  <br>
  4. **Account is disabled:** For templates, bulk account creation, Temporary/Seasonal users, testing, and Security review before deployment.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-6.png">
</p>  <br>

> [!NOTE]  
> *There are many use cases out there, of course. These are just examples.*

___

- Once you choose the desired settings, review them and "Finish". Congratulations, you have your first users!  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-7.png">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-8.png">
</p>

___

- For group creation, We will create a group for each OU and make our new users Members of these groups.  <br>

<p align="center">
  <strong>😨 "Wait, what is the purpose of a group?" 😨</strong>
  <p align="justify">
    <em>The purpose of a group in Active Directory is to simplify user and resource management by grouping users, computers, or other objects. Groups make it easier to assign permissions, access rights, and policies collectively to multiple objects, reducing administrative complexity and enhancing security and resource management.</em>
  </p>
</p>  <br>

___

- Right-click the desired OU > New > Group.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-9.png">
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
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-10.png"><br>
</p>

> [!NOTE]  
> *I selected "Global" and "Security" for my use case since I want to configure permissions and access policies for this group later on in the project.*

___

- Now that we have our new group let's add our Sales users to it:  <br>
  * Select all the desired users.  <br>
  * Right-click > select "Add to group..."  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-11.png">
</p>  <br>

  * A window pops up asking you to search for the desired group:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-12.png">
</p>  <br>

  * We can confirm this by going to a user's properties and navigating to the "Member of" Tab:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-13.png">
</p>

___

- Now, let's take the same steps on our SysAdmin OU.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-14.png">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-15.png">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-16.png">
</p>  <br>

- It also makes perfect sense to add these users to the Domain Admins group (Since they're SysAdmin, right?):

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-17.png">  <br>
  <img src="https://github.com/LoneSalmon/Active-Directory/blob/main/Media/creating-objects-gui-18.png">
</p>

___

<h3>🏭 Creating OUs, Users & Groups Using CMD 🏭</h3>

<p align="center">
  <strong>😨 "But I already have the GUI!" 😨</strong>  <br>
  <p align="justify">
    <em>True, but Imagine getting a task of creating 40, 50, or 200 users. That's time-consuming. Creating objects using CMD in AD is valuable for efficient bulk operations, automated provisioning, and scripting. It's handy when adding multiple users, groups, or other objects with consistent attributes, reducing manual effort and ensuring accuracy. CMD scripts can streamline repetitive tasks, such as onboarding new employees or managing group memberships, improving administrative efficiency, and maintaining a consistent directory environment.</em>
  </p>
</p>

___

<h4>💻 Creating Objects 💻</h4>

- We will first demo creating two users with the following command-line tool: <code><strong>"DSADD"</strong></code>  <br>
- Here's a table that describes what each of the DSADD tools can do:  <br>

| Command | Description |
| ------- | ----------- |
| <strong><code>DSADD computer</code></strong> | Adds a single computer to the directory.|
| <strong><code>DSADD contact</code></strong> | Adds a single contact to the directory.|
| <strong><code>DSADD group</code></strong> | Adds a single group to the directory.|
| <strong><code>DSADD OU</code></strong> | Adds a single organizational unit to the directory.|
| <strong><code>DSADD user</code></strong> | Adds a single user to the directory.|
| <strong><code>DSADD quota</code></strong> | Adds a quota specification to a directory partition.|

- You can use <code><strong>"DSADD /?"</strong></code> or <code><strong>"DSADD user /?"</strong></code> to check what syntax follows each tool.  <br>

<p align="center">
  <a href="https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc753708(v=ws.11)">👉 Here's more info on DSADD 👈</a>
</p>  <br>

> [!NOTE]  
> *I will demonstrate elements crucial to creating an object, as the tool has many options to customize the object or add more information about the object.*

___

- We will start by manually running <strong><code>"DSADD"</code></strong> commands to familiarize ourselves.  <br>
- We will run CMD as admin:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a0484e8d-0dbf-4713-9311-d989ea5ee462">
</p>  <br>

- And input the <strong><code>"DSADD USER"</code></strong> along with it's syntax to add two new users:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/939ac8f3-8a4b-4c9f-a7d2-19046fcbfc48">
</p>  <br>

- Now, if we check in the Active Directory UI, we can see that two new users were created in the "Users" Container:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0dcaa9a9-0fab-4baf-9474-6b64aff973ed">
</p>  <br>

- Now we will demo creating two new groups using the same command but with the "group" syntax;<strong><code>"DSADD GROUP"</code></strong>:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/b4c1f9e5-efc7-4c85-89b2-caa8405f57db">
</p>  <br>

- And confirm that they're created in the AD GUI:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/5c1b3096-06ef-44a6-bfc6-b340090a922b">
</p>  <br>

> [!NOTE]  
> *If you can't see your new users/groups, refresh the UI.*
> *When you want to create a user in a container, you use the syntax "cn" (Container Name), when you want to create the user in an Organizational Unit, you will use "ou".*

___

<h4>💻 Modifying Objects 💻</h4>
- Now that we know how to create users and groups successfully, we will want to add our users to the Groups.  <br>
- To do this, we will use the <strong><code>"DSMOD"</code></strong> command.  <br>
- Here's a table that describes what you can do with <strong><code>"DSMOD"</code></strong>:  <br>

| Command | Description |
| ------- | ----------- |
| <strong><code>DSMOD computer</code></strong> | Modifies attributes of one or more existing computers in the directory.|
| <strong><code>DSMOD contact</code></strong> | Modifies attributes of one or more existing contacts in the directory.|
| <strong><code>DSMOD group</code></strong> | Modifies attributes of one or more existing groups in the directory.|
| <strong><code>DSMOD OU</code></strong> | Modifies attributes of one or more existing organizational units (OUs) in the directory.|
| <strong><code>DSMOD user</code></strong> | Modifies attributes of one or more existing users in the directory.|
| <strong><code>DSMOD quota</code></strong> | Modifies attributes of one or more existing quota specifications in the directory.|
| <strong><code>DSMOD server</code></strong> | Modifies properties of a domain controller.|
| <strong><code>DSMOD partition</code></strong> | Modifies attributes of one or more existing partitions in the directory.|

- You can use <code><strong>"DSMOD /?"</strong></code> or <code><strong>"DSMOD user /?"</strong></code> to check what syntax follows each tool.  <br>

<p align="center">
  <a href="https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc732406(v=ws.11)">👉 Here's more info on DSMOD 👈</a>
</p>  <br>

> [!NOTE]  
> *I will demonstrate elements crucial to modifying an object, as there are many options in the tool itself on how to customize the object or add more information about the object.*

___

- To add our users to the group, we will use the following example:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9b001dbb-4891-4abe-b4ae-a01dbee23b4b">
</p>  <br>

- And confirm that both users are members of "Development" & "Operations" in the GUI:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/65bf8647-4f01-4c97-b341-04ff9d855f1d">
</p>

___

<h3>🤖 Bulk Object Creation Using a Batch Script 🤖</h3>

<p align="center">
  <p align="justify">
    <em>In Active Directory management, manually adding users can be time-consuming. To efficiently create multiple users, you can use Excel in conjunction with scripting to generate a batch script for dsadd user.</em>
  </p>
</p>

<p align="center">
  <strong>😆 "You're referring to Microsoft Excel??" 😆</strong>
  <p align="justify">
    <em>Yes! This allows you to import user data from an Excel spreadsheet and simultaneously create multiple users in Active Directory. The process involves preparing an Excel sheet, entering user data, auto-filling the rest of the users, concatenating each column into a single cell, then copying the rows into Notepad and changing its format to a Batch script. This approach streamlines the user creation process, reduces manual data entry errors, and is particularly useful for administrators dealing with numerous user accounts.</em>
  </p>
</p>

<p align="center">
  <a href="https://www.learnesl.net/perform-bulk-active-directory-operations-using-dsadd/">👉 Here's an excellent guide for this 👈</a>
</p>

___

- In this demo, we will bulk-create ten new users using DSADD.  <br>
- We start by opening an <a href="https://github.com/LoneSalmon/Active-Directory/blob/main/DSADD%20spreadsheet.csv">Excel sheet</a> and adding the elements I used earlier to create one user:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6a32ef37-19d4-499e-8d20-5e5a4a8e1310">
</p>  <br>

- Then, we will use <strong>"=CONCATENATE"</strong> function on the <strong><code>DSADD</code></strong> statement:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/7a725c44-c56e-4c6d-ab45-8205d09e7175">
</p>

___

<p align="center">
  <strong>😨 "What is the "Concatenate" Function?" 😨</strong>
  <p align="justify">
    <em>The function  combines multiple text strings or cell values into a single string. It simplifies the process of joining text to create formatted or structured data, such as creating commands for scripts, as it can merge various elements into a unified string without the need for complex formulas or manual entry. As you can see in the screenshot above, I combined the first column (the username) into the "Common Name" or "CN".</em>
  </p>
</p>

<p align="center">
  <a href="https://support.microsoft.com/en-gb/office/combine-text-from-two-or-more-cells-into-one-cell-81ba0946-ce78-42ed-b3c3-21340eb164a6">👉 Here's more info on CONCAT 👈</a><br>
  <a href="https://support.microsoft.com/en-us/office/excel-functions-alphabetical-b3944572-255d-4efb-bb96-c6d90033e188">👉 And other functions 👈</a><br>
</p>

___

- We will use the same function for the "UPN" (User Principal Name) and "Display":  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/bd07df11-3d3c-4f4c-948a-6f1b10accc47"><br>
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/c6d33b6c-6fbd-4026-b7dd-00056a5267b7">
</p>  <br>

- We will also use the same function for "Password", but only so it doesn't auto-fill other values, not to Concatenate it with other cells.  <br>
- And we will keep the "Must change password" static.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/5dc63bc6-216e-43d3-aa1e-4f9599909dda">
</p>  <br>

- Once you're done filling out all the details, you will need to select all the cells:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/95a7796f-6592-4b1c-bb65-432963ca0fc7">
</p>  <br>

- And drag them to auto-fill the remaining nine cells:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8f4c8428-775f-4179-8e38-bce80d956ae0">
</p>  <br>

- Now, to Concatenate all the cells into one, select a different cell and add the function with the number of the first cells (Excluding A2), and then drag the cell to auto-fill:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/a89189c1-7c2c-49da-944a-0f960730bbba">
</p>  <br>

> [!NOTE]  
> *Mind the space between each command in the spreadsheet and make sure the function syntax is written correctly.*

___

- Select all the single cells that contain the commands, copy and paste them into Notepad in DC1:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6666ed36-3fc8-4bf0-8c50-2db3823d86d2">
</p>  <br>

- Save the notepad file and change its extension from .txt to .bat:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/386254b4-20b4-4297-9507-bd2c5a14862e">
</p>  <br>

<p align="center">
  <strong>😨 "Why did you add (pause) at the end?" 😨</strong>
  <p align="justify">
    <em>When running a batch script, it runs all the commands in order and then exits when done. I use the pause command to prevent that so I could check what were the responses to the commands, troubleshoot if necessary, and actually manage to get a screenshot for you ;)</em>
  </p>
</p>

___

- Run the batch script with Administrator Privileges and watch the magic happen:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6e6bbd2e-39af-4671-959e-52028b71ff46">
</p>  <br>

- Confirm that the users were created in Active-Directory Users & Computers:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/afd1b917-54cb-423c-8ca0-2865b5eedefd">
</p>  <br>

___

<h3>🏭 Creating OUs, Users & Groups Using PowerShell 🏭 </h3>

<p align="center">
  <p align="justify">
    <em>PowerShell is a powerful tool for efficiently managing Active Directory Users and Computers. This scripting and automation platform enables administrators to streamline user account management, group operations, and other directory-related tasks with precision and scalability. Leveraging PowerShell, administrators can perform bulk operations, automate routine tasks, and gain granular control over user attributes, all while simplifying the management of Active Directory objects.</em>
  </p>
</p>  <br>

<p align="center">
  <strong>😨 "But we already have CMD!" 😨</strong>
  <p align="justify">
    <em>The primary difference between PowerShell and CMD for AD management lies in their capabilities. While CMD provides basic command-line functionality, PowerShell offers a more versatile environment for managing AD. PowerShell is specifically designed to work with AD and provides a rich set of commandlets tailored for tasks such as user and group management, enabling automation, scripting, and fine-grained control over directory objects. This makes it the preferred choice for administrators seeking to streamline and enhance AD management tasks.</em>
  </p>
</p>  <br>

<p align="center">
  <a href="https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.2">👉 Here's more info on PowerShell 👈</a>
</p>

___

- We will begin by creating a new Organizational Unit using the <a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-adorganizationalunit?view=windowsserver2022-ps"><strong><code>"New-ADOrganizationalUnit"</code></strong></a> Cmdlet.  <br>
- The first thing we must do is run PS as an administrator.  <br>
- Then, we will need to import the Active-Directory Module using the <a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps"><strong><code>"Import-Module ActiveDirectory"</code></strong></a> Cmdlet and a brief loading screen will pop-up:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/bd7d10ca-9e5b-4497-9c21-148469de2ab0">
</p>  <br>

<p align="center">
  <strong>😨 "Why did you do that?" 😨</strong>
  <p align="justify">
    <em>It is essential for accessing a set of specialized cmdlets designed for streamlined, granular, and automated AD management tasks, ensuring efficiency and accuracy. However, you can still use standard command-line tools for basic AD tasks without importing the AD module in PowerShell. These commands include utilities like <code>dsquery</code>, <code>dsadd</code>, <code>dsmod</code>, and <code>dsrm</code>.</em>
  </p>
</p>  <br>

___

- Now that we've imported the module, we can use the <strong><code>"New-ADOrgnaizationalUnit"</code></strong> as follows:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/2482b2b2-b4e3-42c7-bf64-059681c1c48f">
</p>  <br>

- And if we check on our AD GUI, we can see that the OU has appeared there already:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/48e28d8c-7c9a-495c-a8ba-e168e1564246">
</p>  <br>

> [!NOTE]  
> *You don't need to remember each cmdlet to the letter. Partially writing the cmdlet and then clicking the "TAB" button will auto-fill it.*

___

- Now let's create a new group using the <a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-adgroup?view=windowsserver2022-ps"><strong><code>"New-ADGroup"</code></strong></a> cmdlet and point that group to the OU we just created:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8eca303a-a8d3-41d0-b8ed-435dfa858b2d">
</p>  <br>

- Check the GUI, and you'll find your new group in the OU you created:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/f65788bc-63fc-46aa-a0dd-39e5a378603f">
</p>  <br>

___

- For the last demo, we're going to create a new user using the <a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps"><strong><code>"New-ADUser"</code></strong></a> cmdlet and point it to our new OU:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/19b72ad7-905c-47af-b777-e2712d3cc51c">
</p>  <br>

- Look at all the info we can conjure up for a single user. Now let's check the user in the GUI:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6a1ad8ab-f18a-4dbf-aae7-aee6235c47d2">
</p>  <br>

___

<h3>🤖 Bulk Object Creation Using a PowerShell Script 🤖</h3>

<p align="center">
  <p align="justify">
    <em>Just like in CMD, we will also be using a .CSV file (Excel Spreadsheets) to create our script, only this time, most of the work will be done on PowerShell. I will give you a hypothetical scenario where you just received an Excel table for 10 new recruits to be added to your Development Organizational Unit and an easy way to import all that data into a PowerShell script and then run such scripts with a click of a button.</em>
  </p>
</p>  <br>

<p align="center">
  <a href="https://www.imanami.com/bulk-user-creation-in-active-directory/">👉 Here's a great guide for this 👈 </a>
  
___

<p align="justify">
  Early work-day morning, you're having your last sip of coffee and then <strong><em>"DING!"</em></strong> an email with an Excel sheet of ten new Developers you need to add to your Active-Directory OU. Your stomach twists! Horrified, you think about how you will waste your entire workday creating fresh new users manually instead of slacking off somewhere. Luckily, you find this guide while frantically searching the Internet, restoring your inner peace.
</p>  <br>

- This is the <a href="https://github.com/LoneSalmon/Active-Directory/blob/main/PowerShell%20Spreadsheet.csv">Excel Spreadsheet</a> you received: (I already Concatenated all the data for simplicity)  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/45f3fd71-4666-4212-aff9-2420ffc81c80">
</p>  <br>

___

- We will begin building our PowerShell Script Using PowerShell ISE.  <br>

<p align="center">
  <strong>😨 "What is PowerShell ISE?" 😨</strong>
  <p align="justify">
    <em>PowerShell Integrated Scripting Environment (ISE) is a graphical user interface (GUI) application that serves as a development environment for PowerShell scripting. It provides an interface for creating, editing, testing, and running PowerShell scripts and commands. PowerShell ISE offers code highlighting, tab completion, script execution, and debugging tools. It's much more user-friendly than a simple Notepad.</em>
  </p>
</p>  <br>

___

- Here's the relevant <a href="https://github.com/LoneSalmon/Active-Directory/blob/main/PS%20Script.ps1">script</a> I wrote to bulk-create the users found in the Excel Spreadsheet:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/8cde9e21-6244-45aa-9a85-c4541cd4eb33">
</p>  <br>

- Let's break it down to each component to understand the concepts:

| Component | Description |
| ------- | ----------- |
|<strong><code>Import-Module ActiveDirectory</code></strong>| Imports Active Directory module for user management tasks.|
|<strong><code>$users = Import-Csv -LiteralPath "C:\..."</code></strong>| Reads user data from a CSV file for creating new user accounts.|
|<strong><code>foreach ($user in $users)</code></strong>| Iterates through user data entries in the CSV.|
|<strong><code>$UserName = $user.UserName...</code></strong>| Assigns user attributes from CSV to variables for easy access.|
|<strong><code>New-ADUser -Name $UserName...</code></strong>| Creates new user accounts in Active Directory using extracted data from the .csv and the variables we assigned earlier.|

___

- Now let's test this script by running it in PowerShell ISE:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/88c33f72-012e-42cc-bc48-6fe859b41fd1">
</p>  <br>

- In the console Side, we can see the script running successfully/producing errors, etc:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/0f422801-0610-491e-9d91-b71f81415560">
</p>  <br>

- In this case, the script ran successfully if no response was printed in the console.
- We can confirm this in the ADUC GUI:

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/9db0f8db-9a28-4688-bb06-a5ecf41da5ea">
</p>  <br>

> [!NOTE]  
> *1. I used <space> + backtick "`" to let the command New-ADUser continue in a new line. If you simply hit Enter, your script won't run.*<br>
> *2. You can add more functionalities like printing "The user "XXX" has been created successfully" for each run etc. The possibility for customization is almost endless.*

___

<h3>🧪 Testing Replication and user login 🧪</h3>

- Let's check that our users replicated to DC2 successfully and that we can log in to some of the users to test that they're working correctly.  <br>
- Start by checking the replication status by going to DC2 > Active Directory Users & Computers tool.  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/6bf60e79-d9b5-451b-bdf6-9d64c8c27f30">
</p>  <br>

- Here, we can see that our users replicated to DC2 successfully.  <br>

___

- Let's check if we can log on to our Windows machine using one of the users:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/d7fac684-65b7-4fc3-a9f9-baa96de49fce">
</p>  <br>

- As soon as we log in, we are asked to reset the password since I added the "must change password at first logon" argument in the cmdlet:  <br>

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/5df2e502-05f9-49fa-9661-ced99a46c56f">
</p>  <br>

- And now you're logged in successfully as "John Shepard":

<p align="center">
  <img src="https://github.com/LoneSalmon/Active-Directory/assets/132819728/66d214d6-3b57-4e7d-96cd-96d10d238666">
</p>

<div align="center">

|[☝️ Back to top ☝️](#-%EF%B8%8F-active-directoy-users--computers-management-%EF%B8%8F-)|[📑 Table of Contents 📑](#--table-of-contents-)|
|---|---|

</div>

![-----------------------------------------------------](https://github.com/LoneSalmon/Active-Directory/blob/main/Media/Split-Bar.png)

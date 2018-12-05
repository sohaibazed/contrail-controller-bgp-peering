**Prerequisites**: A host machine with Ubuntu/CentOS OS preinstalled with Vagrant & VirtualBox SW.

For Vagrant and VirtualBox setup [vagrant-host-setup/README.md](https://gitlab.com/sohaibazed/contrail-all-in-one/tree/master/vagrant-host-setup)

### Download Repo from Gitlab
```bash
host> git clone https://gitlab.com/sohaibazed/contrail-controller-bgp-peering.git 
host> cd contrail-controller-bgp-peering 
```

### Update Docker repository password in instances.yml file.
Place contrail-ansible-deployer-5.0.2-0.360.tgz in project directory and updated hub.juniper.net docker repository passwords in instances.yaml files. 
```bash
host> vi scripts/instances1.yml
host> vi scripts/instances2.yml
```

### Run vagrant deployer.
```bash
host> vagrant status
host> vagrantup
```

### How to use Foxy Proxy for GUI access

Follow these steps for GUI access via FoxyProxy.
1- Open FireFox and open https://addons.mozilla.org/en-US/firefox/ URL.
2- Search for FoxyProxy and select "FoxyProxy Standard"
3- Click on "Add to Firefox"


![Web Console](/Images/FoxyProxy-Install.png)

Now open ssh port forwading session to physical server using port 1080. please change IP as per your host config

```bash
your-laptop> ssh root@<< physical server ip>> -D 1080
```

Configure FireFox FoxyProxy add-on by configuring "127.0.0.1" & port 1080 as Scoks4 as captured in screenshot.

![Web Console](/Images/FoxyProxy-Configure.png)

Now enable FoxyProxy add-on by selecting the profile created earlier and open Contrail GUI using IP address of Vagrant VM https://30.30.30.31:8143

![Web Console](/Images/FoxyProxy-Contrail-GUI-k8s.png)

## Access Contrail and Openstack UIs

| Deployement # | Service   | URL                         | Username | Password    |
| ------------- | --------- | --------------------------- | -------- | ----------- |
| 1 | openstack | http://192.168.100.21       | admin    | contrail123 |
| 1 | contrail  | https://192.168.100.21:8143 | admin    | contrail123 |
| 2 | openstack | http://192.168.100.22       | admin    | contrail123 |
| 2 | contrail  | https://192.168.100.22:8143 | admin    | contrail123 |
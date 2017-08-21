# VAGRANT

Vagrant is a tool for building and managing virtual machine environments in a single workflow

## Getting Started

Vagant will help you to craete env in your local. for that you need vagrant and virtual box on your local to run vagrant.

### Prerequisites

Install the vagrant on your local from below urls :-

```
Vagrant : https://www.vagrantup.com/downloads.html

Vagrant box : https://app.vagrantup.com/boxes/search

Oracle VirtualBox : https://www.virtualbox.org/wiki/Downloads
```

## Tests vagrant running and installed
Command Prompt :- 

```
$ vagrant -v
$ vagrant box add ubuntu/trusty64
$ vagrant init ubuntu/trusty64
$ vagrant up
``` 

## Networking
### Chose atlest one IP addressing
#### Add line after below syntax as per need for networking requirement.

- config.vm.box = "hashicorp/precise64"

### Port Forwarding
```
config.vm.network "forwarded_port", guest: 80, host: 8089
```

### Dyanmic IP
```
config.vm.network "private_network", type: "dhcp"
```

### Static IP
```
config.vm.network "private_network", ip: "84.0.0.10"
```

## CPU & Memory
### Optional if you need change CPU
#### Add line next to syntax config.vm.provider
- Type 1
```
config.vm.provider "virtualbox" do |vb|
v.memory = 2048
v.cpus = 2
v.gui = true
v.name = "TEST!"
end
```
Example - 
- v.memory = RAM you want to use in VM 1024 = 1GB
- v.cpus = core no to cpu
- v.gui = add only if you want to open gui mode if you want to use then also install gui packge in ubuntu
```
sudo apt-get install --no-install-recommends lubuntu-desktop
```
- v.name = any name of your wish.

- TYPE 2
```
config.vm.provider "virtualbox" do |vb|
vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50", "--cpus", "1"]
vb.memory = 2048
end
```

## Multi Vagrant
### Optional if you need multi vagrant
#### Add line after below syntax as per need here we create one elb and 2 appserver.

- Vagrant.configure("2") do |config|

```
config.vm.define "lb1" do |lb|
lb.vm.box = "ubuntu/trusty64"
end

config.vm.define "web1" do |appserver1|
appserver1.vm.box = "ubuntu/trusty64"
end

config.vm.define "web2" do |appserver2|
appserver2.vm.box = "ubuntu/trusty64"
end
```

## Vagrant install apache with script and cmd
#### Add at end of vagrant file before end syntax.
- end

- case 1 = install using script
```
config.vm.provision :shell, :path => "bootstrap.sh"
```
- case 2 = install using cmd or inline 
```
config.vm.provision "shell", inline: <<-SHELL 
  sudo apt-get update 
  sudo apt-get install -y apache2
SHELL
```

## Multi Part Vagrant ALL
### Clean Vagrantfile and add below.
```
Vagrant.configure("2") do |config|

config.vm.define "lb" do |lb|
  lb.vm.box = "ubuntu/trusty64"
  lb.vm.network "private_network", ip: "84.0.0.10"
  lb.vm.provision "shell", inline: <<-SHELL 
  sudo apt-get update 
  sudo apt-get install -y nginx
SHELL

config.vm.define "app1" do |app1|
  app1.vm.box = "ubuntu/trusty64"
  app1.vm.network "private_network", ip: "84.0.0.20"
  app1.vm.provision "shell", inline: <<-SHELL 
  sudo apt-get update 
  sudo apt-get install -y apache2
SHELL
end

config.vm.define "app2" do |app2|
  app2.vm.box = "ubuntu/trusty64"
  app2.vm.network "private_network", ip: "84.0.0.30"
  app2.vm.provision "shell", inline: <<-SHELL 
  sudo apt-get update 
  sudo apt-get install -y apache2
SHELL
end

config.vm.provider "virtualbox" do |vb|
vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50", "--cpus", "1"]
vb.memory = 2048
end
```
### Webserver Test 

- Open Ip on Browser 84.0.0.10

## Authors

* **Harish Chander Dalal** - *Initial work* - [PurpleBooth](https://github.com/harishchanderdalal)

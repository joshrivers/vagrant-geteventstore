vagrant-geteventstore
=====================

Vagrant environments for GetEventStore. Currently runs version 3.0.0rc2

To use build the vagrant environment

    vagrant up

When it's finished provisioning, then visit http://192.168.50.11:2113/ in your browser
    
If you want to make the finished machine into a box that you can restore multiple times,

	vagrant package --vagrantfile Vagrantfile.pkg

	vagrant box add eventstore ./package.box

Then move to an empty directory,

	vagrant init eventstore

	vagrant up

* Vagrant
* VirtualBox
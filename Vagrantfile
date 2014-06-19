Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v, override|
      override.vm.box = "Ubuntu precise 64"
      override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    end

    config.vm.define "eventstore" do |eventstore|
        eventstore.vm.network "private_network", ip: "192.168.50.11"
        eventstore.vm.network :forwarded_port, guest: 2113, host: 2113
        eventstore.vm.provision :shell, :path => "single-bootstrap.sh"
    end
end 

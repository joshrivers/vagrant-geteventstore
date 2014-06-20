Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v, override|
      override.vm.box = "Ubuntu precise 64"
      override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    end

    config.vm.network "private_network", ip: "192.168.50.11"
    config.vm.network :forwarded_port, guest: 2113, host: 2113
    config.vm.network :shell, :path => "single-bootstrap.sh"
end 

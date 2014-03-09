# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
yum install -y git ImageMagick-devel
source /usr/local/rvm/scripts/rvm
rvm use --install 2.1.1
echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
gem install thin -v 1.3.1
gem install rmagick
gem install pdfkit
gem install showoff
SCRIPT


Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize [
      "modifyvm", :id,
      "--memory", "512",
      "--cpus", "4",
      "--natdnspassdomain1", "off",
      ]
  end


  config.vm.define :showoff do |showoff|
    showoff.vm.box = "puppet-centos-65-x64"
    showoff.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
    #showoff.vm.network "private_network", ip: "10.0.0.20"
    #showoff.vm.network "public_network", :bridge => "en0: Wi-Fi (AirPort)"
    showoff.vm.network "public_network"
    showoff.vm.hostname = "showoff"
    showoff.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "2048" ]
    end
    showoff.vm.provision :shell, :path => "install-rvm.sh",  :args => "stable"
    showoff.vm.provision :shell, :path => "install-ruby.sh", :args => "2.1.1"
    showoff.vm.provision :shell, :inline => $script
  end
end

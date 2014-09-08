# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.customize ["modifyvm", :id, "--memory", 512]
  config.vm.forward_port 80, 8000
  config.vm.network :hostonly, '11.0.0.8'  # Update the fabfile.py if you update this

  config.vm.share_folder("vagrant-root", "/vagrant", ".", :nfs => true)
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/vagrant.yml"
    ansible.inventory_path = "ansible/hosts"
    ansible.verbose = "v"
  end
end

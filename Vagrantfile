# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'example.com'

Vagrant::Config.run do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = 'centos6'
    master_config.vm.box_url = 'https://vagrant-centos-6.s3.amazonaws.com/centos-6.box'
    master_config.vm.host_name = "salt.#{domain}"
    master_config.vm.network :hostonly, '172.16.42.10'

    master_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = 'centos6'
    minion_config.vm.box_url = 'https://vagrant-centos-6.s3.amazonaws.com/centos-6.box'
    minion_config.vm.host_name = "minion1.#{domain}"
    minion_config.vm.network :hostonly, '172.16.42.11'

    minion_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = 'centos6'
    minion_config.vm.box_url = 'https://vagrant-centos-6.s3.amazonaws.com/centos-6.box'
    minion_config.vm.host_name = "minion2.#{domain}"
    minion_config.vm.network :hostonly, '172.16.42.12'

    minion_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end
end

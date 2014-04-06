# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECT_HOME = ENV['PROJECT_HOME'] || "#{ENV.fetch('HOME')}/Development"

Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.hostname = 'pivm.local'
  config.vm.network :forwarded_port, guest: 4443, host: 4443
  config.vm.network :private_network, ip: '192.168.33.10'

  ['Great', 'PiPy'].each do |project|
    dir = "#{PROJECT_HOME}/#{project}"
    if File.directory?(dir)
      config.vm.synced_folder dir, "/srv/pipy/#{project}"
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.extra_vars = 'vars/vagrant.yml'
    ansible.playbook = 'playbook.yml'
    ansible.tags = ENV['ANSIBLE_TAGS']
    ansible.verbose = ENV['ANSIBLE_VERBOSITY']
  end
end

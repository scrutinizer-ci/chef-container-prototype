# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
require 'json'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  root = File.expand_path(File.dirname(__FILE__))
  scrutinizerConfig = YAML.load_file(root + "/.scrutinizer.yml")

  config.vm.box = case scrutinizerConfig['build']['container']
    when "base/ubuntu/trusty/amd64"
      "chef/ubuntu-14.04"
    when "base/ubuntu/precise/amd64"
      "chef/ubuntu-12.04"
    else
      raise "Unknown base container '" + scrutinizerConfig['build']['container'] + "'"
    end

  config.vm.provider "docker" do |d|
    d.image = case scrutinizerConfig['build']['container']
      when "base/ubuntu/trusty/amd64"
        "ubuntu:14.04"
      when "base/ubuntu/precise/amd64"
        "ubuntu:12.04"
      else
        raise "Unknown base container '" + scrutinizerConfig['build']['container'] + "'"
      end
  end

  unless scrutinizerConfig['build']['dependencies'].nil?
    scrutinizerConfig['build']['dependencies'].each do |k, v|
      v.each do |cmd|
        config.vm.provision "shell", inline: cmd
      end
    end
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = root + "/cookbooks"
    chef.json = JSON.parse(File.read(root + "/attributes.json"))
  end
end

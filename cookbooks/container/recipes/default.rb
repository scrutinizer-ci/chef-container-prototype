#
# Cookbook Name:: container
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "scrutinizer" do
  shell "/bin/bash"
  supports ({:manage_home => true})
end
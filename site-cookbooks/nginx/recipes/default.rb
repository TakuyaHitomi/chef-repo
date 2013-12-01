#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "nginx.conf" do
  path "/etc/nginx/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end

cookbook_file "cookbook_test" do
  path "/tmp/cookbook_test.txt"
  source "cookbook_test.txt"
  owner "root"
  group "root"
  mode 0644
  checksum "5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03"
end

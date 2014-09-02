#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/home/#{node.user}/.rbenv" do
  owner "#{node.user}"
  mode "0755"
  action :create
end

# gitからrbenvを落としてくる(#{node.user}はrootです)
git "/home/#{node.user}/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "#{node.user}"
end

# ruby-build用のpluginフォルダを作成する
directory "/home/#{node.user}/.rbenv/plugins" do
  owner "#{node.user}"
  mode "0755"
  action :create
end

# ruby-buildを落としてくる
git "/home/#{node.user}/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "#{node.user}"
end

# rbenvのbash設定を追加
template "/etc/profile.d/rbenv.sh" do
  owner "#{node.user}"
  group "#{node.user}"
  mode 0644
end

package "sqlite3" do
  action :install
end

package "libsqlite3-dev" do
  action :install
end

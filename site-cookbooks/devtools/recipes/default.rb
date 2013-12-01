#
# Cookbook Name:: devtools
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

tools = ["vim", "git"]

tools.each do |tool|
  package tool do
    action :install
  end
end

cuser = node[:current_user]
gitrepos = "/home/#{cuser}/gitrepos"

directory "gitrepos" do
  path gitrepos
  owner cuser
  group cuser
  action :create
end

dotfiles = gitrepos + "/dotfiles"

git dotfiles do
  repository "git://github.com/TakuyaHitomi/dotfiles.git"
  reference "master"
  action :checkout
end

bash "install-dotfiles" do
  user cuser
  group cuser
  cwd dotfiles
  code <<-EOC
    ./install.sh
  EOC
end

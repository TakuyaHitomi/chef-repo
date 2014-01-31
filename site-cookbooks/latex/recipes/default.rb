#
# Cookbook Name:: latex
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "software-properties-common" do
  action :install
end

package "python-software-properties" do
  action :install
end

bash "add ppa" do
  code <<-EOC
    sudo add-apt-repository ppa:texlive-backports/ppa
    sudo apt-get update
  EOC
end

package "texlive-lang-cjk" do
  action :install
end

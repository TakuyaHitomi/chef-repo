#
# Cookbook Name:: haskell
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "haskell-platform" do
  action :install
end

package "yesod" do
  action :install
end

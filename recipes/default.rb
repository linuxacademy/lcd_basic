#
# Cookbook:: lcd_basic
# Recipe:: default
#
# Copyright:: 2017, Student Name, All Rights Reserved.

include_recipe 'php::default'

package 'net-tools'

package 'apache package' do
  case node[:platform]
  when 'centos'
    package_name 'httpd'
  when 'ubuntu'
    package_name 'apache2'
  end
end

service 'apache service' do
  case node[:platform]
  when 'centos'
    service_name 'httpd' 
  when 'ubuntu'
    service_name 'apache2' 
  end
    action [:enable, :start]
end

group 'developers'

user 'webadmin' do
  manage_home true
  gid   'developers'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'developers'
  mode '664'
end

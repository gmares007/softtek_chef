#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2018, Gonzalo Lopez, All Rights Reserved.

node.default["port"]="81"

package 'Instal httpd' do
  case node[:platform]
    when 'redhat', 'centos'
      package_name 'httpd'
    when 'ubuntu', 'debian'
      package_name 'apache2'
    end
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
end

service 'Enable httpd' do
  case node[:platform]
    when 'redhat', 'centos'
      service_name 'httpd'
    when  'ubuntu', 'debian'
      service_name 'apache2'
    end
    action [:enable, :restart]
end

#
# Cookbook Name:: Load_Monitor
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
directory '/home/ubuntu/Load_Monitor' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end
directory '/home/ubuntu/Load_Monitor/bin' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end
directory '/home/ubuntu/Load_Monitor/scripts' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end
directory '/home/ubuntu/Load_Monitor/log' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end
directory '/home/ubuntu/Load_Monitor/output' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end
template '/home/ubuntu/Load_Monitor/bin/load_V1.py' do
  source 'load_V1.py.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0777'
end
template '/home/ubuntu/Load_Monitor/bin/test.py' do
  source 'test.py.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0777'
end
template '/home/ubuntu/Load_Monitor/scripts/load.sh' do
  source 'load.sh.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0777'
end
template '/etc/init.d/load' do
  source 'load.sh.erb'
  owner 'root'
  group 'root'
  mode '0777'
end
template '/etc/init/load.conf' do
  source 'Load_Monitor_service.conf.erb'
  owner 'root'
  group 'root'
  mode '0777'
end
execute 'load_rc_update' do
  command 'update-rc.d load defaults 97 03'
end
service "load" do
  supports :status => true, :start => true, :stop => true
  start_command "/etc/init.d/load start"
  stop_command "/etc/init.d/load stop"
  status_command "/etc/init.d/load status"
  action [ :enable, :start ]
end

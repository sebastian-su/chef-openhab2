#
# Cookbook Name:: openhab2
# Recipe:: backup
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template '/usr/local/bin/openhab2_backup' do
  source 'backup.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    backup_destination: node['openhab2']['backup_destination']
  )
end

cron 'openhab2_backup' do
  minute  '0'
  hour    '0'
  weekday '*'
  command '/usr/local/bin/openhab2_backup'
end

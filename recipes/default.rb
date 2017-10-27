#
# Cookbook Name:: openhab2
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "java"

package 'apt-transport-https'

apt_repository 'openhab2' do
    uri             "https://dl.bintray.com/openhab/apt-repo2"
    components      ['stable', 'main']
    distribution    ''
    key             'https://bintray.com/user/downloadSubjectPublicKey?username=openhab'
 end
  
package 'openhab2' do
    action :install
    options "--force-yes"
end

service "openhab2" do
    action [ :enable, :start ]
end
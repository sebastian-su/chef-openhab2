#
# Cookbook Name:: openhab2
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'openhab2::default' do
  context 'on ubuntu 16.04 with default attributes' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs & configures openhab2' do
      expect(chef_run).to install_package('openhab2')
      expect(chef_run).to install_package('apt-transport-https')
      expect(chef_run).to add_apt_repository('openhab2')
      expect(chef_run).to start_service('openhab2')
    end
  end

end

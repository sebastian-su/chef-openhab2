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

    it 'installs openhab2 packages' do
      expect(chef_run).to install_package('apt-transport-https')
      expect(chef_run).to add_apt_repository('openhab2')
      expect(chef_run).to install_package('openhab2')
    end

    it 'installs & configures the service' do
      expect(chef_run).to enable_service('openhab2')
      expect(chef_run).to start_service('openhab2')
    end
  end

  context 'on ubuntu 16.04 with backup true' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.automatic['openhab2']['backup'] = true
        node.automatic['openhab2']['backup_destination'] = '/var/backup/'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the backup recipe' do
      expect(chef_run).to include_recipe('openhab2::backup')
    end

    it 'creates backup cronjob' do
      expect(chef_run).to create_cron('openhab2_backup')
    end

    it 'creates the backup script' do
      expect(chef_run).to create_template('/usr/local/bin/openhab2_backup').with(
        user: 'root',
        group: 'root'
      )
      expect(chef_run).to render_file('/usr/local/bin/openhab2_backup').with_content('mkdir /var/backup/$TIMESTAMP')
    end
  end
end

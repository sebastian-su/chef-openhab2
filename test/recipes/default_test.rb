# # encoding: utf-8

# Inspec test for recipe openhab2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe package('openhab2') do
  it { should be_installed }
end

describe service('openhab2') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
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

describe port(8080) do
  before do
    60.times do
      if system("netstat -ntl | grep :8080 ")
        puts "openhab2 service is up"
        return 0
      else
        sleep(1)
        puts "still waiting for service..."
        next
      end
    end
  end
  it{ should be_listening }
end
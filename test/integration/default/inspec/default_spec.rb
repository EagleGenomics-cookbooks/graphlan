# Tests to check if the infrastructure we expect is available

# Check that Java was installed
describe command('which graphlan.py') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/graphlan} }
end

# Check that we have the correct version of Java
describe command('graphlan.py -v') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/0.9.7/) }
end

# Check that the KneadData installation directory was created successfully
describe file('/usr/local/graphlan') do
  it { should be_directory }
end

# Check that the KneadData setup file is where it should be
describe file('/usr/local/graphlan/graphlan.py') do
  it { should be_file }
end

describe command('which python') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/python} }
end

# Check that the python version is 2.7
describe command('python --version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/2.7/) }
end

describe command('echo $PATH') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(/graphlan/) }
end

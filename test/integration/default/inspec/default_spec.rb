# Tests to check if the infrastructure we expect is available

# Check that graphplan is installed
describe command('which graphlan.py') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/graphlan} }
end

# Check that we have the correct version of graphlan
describe command('graphlan.py -v') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/0.9.7/) }
end

# Check that the Graphlan installation directory was created successfully
describe file('/usr/local/graphlan') do
  it { should be_directory }
end

# Check that the Graphlan script file is where it should be
describe file('/usr/local/graphlan/graphlan.py') do
  it { should be_file }
end

# Check that export2graphlan is installed
# NB no version number for export2graphlan
describe command('which export2graphlan.py') do
  its('exit_status') { should eq 0 }
end  

# Check python is installed
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

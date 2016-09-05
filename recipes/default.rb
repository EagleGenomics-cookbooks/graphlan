#
# Cookbook Name:: graphlan
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

include_recipe 'apt' if node['platform_family'] == 'debian'
include_recipe 'poise-python'
include_recipe 'mercurial'

# install required packages for matplotlib
if node['platform_family'] == 'debian'
  package %w(libpng12-dev libfreetype6-dev pkg-config g++)
end

# install the Python runtime
python_runtime '2' do
  version '2.7'
  pip_version '8.1.2'
end

python_package 'biopython' do
  version '1.67'
end

python_package 'matplotlib' do
  version '1.5.1'
end

python_package 'scipy' do
  version '0.18.0'
end

python_package 'pandas' do
  version '0.18.0'
end

# check out the GraPhlAn sources
mercurial node['graphlan']['install_dir'] do
  repository 'https://hg@bitbucket.org/nsegata/graphlan'
  reference node['graphlan']['version']
  action :clone
end

magic_shell_environment 'GRAPHLAN_VERSION' do
  value node['graphlan']['version']
end

# NOTE: the 'filename' feature is only available in a pull request version of magic_shell,
#       NOT the Chef Supermarket version. Hence a custom Berksfile entry is required.
magic_shell_environment 'PATH' do
  filename 'graphlan'
  value "$PATH:#{node['graphlan']['install_dir']}:#{node['export2graphlan']['install_dir']}"
end

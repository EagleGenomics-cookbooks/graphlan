#
# Cookbook:: graphlan
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

include_recipe 'python_setup'

# requirement for export2graphlan
# install required packages for matplotlib
package 'Install libraries' do
  case node['platform']
  when 'ubuntu', 'debian'
    package_name %w(libpng-dev libfreetype6-dev pkg-config g++)
  end
end

pyenv_pip 'numpy' do
  version '1.11.1'
end

pyenv_pip 'biopython' do
  version '1.67'
end

pyenv_pip 'matplotlib' do
  version '1.5.1'
end

pyenv_pip 'scipy' do
  version '0.18.0'
end

pyenv_pip 'pandas' do
  version '0.18.0'
end

git 'checkout graphlan src code' do
  destination node['graphlan']['install_dir']
  repository node['graphlan']['src_repo']
  revision node['graphlan']['version']
  action :export
end

# graphlan uses a git submodule, but this module does not export when using tagged versions,
# so we check it out as a subdirectory
git 'checkout export2graphlan src code' do
  destination node['export2graphlan']['install_dir']
  repository node['export2graphlan']['src_repo']
  action :export
end

# export2graphlan uses a git submodule, but because of complications exporting submodule,
# so we export it directly into a subdirectory
git 'checkout hclust2 src code' do
  destination node['hclust2']['install_dir']
  repository node['hclust2']['src_repo']
  action :export
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

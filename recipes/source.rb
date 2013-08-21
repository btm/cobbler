#
# Cookbook Name:: cobbler
# Recipe:: source
#
# Copyright 2013, Guilhem Lettron <guilhem@lettron.fr>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "cobbler::_common"
include_recipe "cobbler::_common_cobblerd"
include_recipe "cobbler::_common_web"
include_recipe "cobbler::_common_koan"

include_recipe "git"
include_recipe "build-essential"

directory node['cobbler']['path'] do
  owner node['cobbler']['user']
  group node['cobbler']['group']
end

python_virtualenv "cobblerd" do
  path node['cobbler']['path']
  owner node['cobbler']['user']
  group node['cobbler']['group']
end

# Required to build a pip package
package "libcurl4-openssl-dev"

# Required by urlgrabber but not in specified
python_pip 'pycurl' do
  virtualenv node['cobbler']['path']
end

["Cheetah", "netaddr", "simplejson", "urlgrabber", "PyYAML"].each do |pack|
  python_pip pack do
    virtualenv node['cobbler']['path']
  end
end

python_pip "django" do
  virtualenv node['cobbler']['path']
  version "1.3.7"
end

deploy_revision ::File.join(node['cobbler']['path'],"cobbler") do
  repo node['cobbler']['source']['repo']
  revision node['cobbler']['source']['version'] if node['cobbler']['source']['version']
  user node['cobbler']['user']
  group node['cobbler']['group']
  migrate false
#  migration_command "make devinstall"
  migration_command ". #{::File.join(node['cobbler']['path'],"bin","activate")}; make install"
  symlink_before_migrate({})
end

#execute "Install cobblerd" do
#  command "make webtest"
#  user node['cobbler']['cobblerd']['user']
#  cwd ::File.join(node['cobbler']['cobblerd']['path'], "current")
#end

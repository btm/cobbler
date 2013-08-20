#
# Cookbook Name:: cobbler
# Recipe:: cobblerd_source
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

python_virtualenv "cobblerd" do
  path node['cobbler']['cobblerd']['path']
  owner node['cobbler']['cobblerd']['user']
  group node['cobbler']['cobblerd']['group']
end

node['cobbler']['cobblerd']['source']['packages_required'].each do |pack|
  package pack
end

node['cobbler']['cobblerd']['source']['packages_pip_required'].each do |pack|
  python_pip pack do
    virtualenv node['cobbler']['cobblerd']['path']
  end
end

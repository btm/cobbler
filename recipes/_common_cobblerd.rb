#
# Cookbook Name:: cobbler
# Recipe:: _common_install
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

["createrepo", "genisoimage", "syslinux", "yum-utils"].each do |pack|
  package pack
end

include_recipe "tftp"
include_recipe "rsync"
include_recipe "python"
include_recipe "apache2"
include_recipe "apache2::mod_wsgi"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_proxy"

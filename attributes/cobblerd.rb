include_attribute "cobbler"

default['cobbler']['cobblerd']['install_method']        = node['cobbler']['install_method']
default['cobbler']['cobblerd']['root_path']             = node['cobbler']['path']
default['cobbler']['cobblerd']['path']                  = ::File.join(node['cobbler']['cobblerd']['root_path'], "cobblerd")
default['cobbler']['cobblerd']['user']                  = node['cobbler']['user']
default['cobbler']['cobblerd']['group']                 = node['cobbler']['group']

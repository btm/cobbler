include_attribute "cobbler"

default['cobbler']['web']['install_method']                  = node['cobbler']['install_method']
default['cobbler']['web']['packages_required']               = []
default['cobbler']['web']['source']['packages_required']     = []
default['cobbler']['web']['source']['packages_pip_required'] = ["django==1.3.7"]
default['cobbler']['web']['user']                            = node['cobbler']['user']
default['cobbler']['web']['group']                           = node['cobbler']['group']

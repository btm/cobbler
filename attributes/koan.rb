include_attribute "cobbler"

default['cobbler']['koan']['install_method']                  = node['cobbler']['install_method']
default['cobbler']['koan']['packages_required']               = []
default['cobbler']['koan']['source']['packages_required']     = []
default['cobbler']['koan']['source']['packages_pip_required'] = ["simplejson"]
default['cobbler']['koan']['user']                            = node['cobbler']['user']
default['cobbler']['koan']['group']                           = node['cobbler']['group']

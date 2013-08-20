include_attribute "cobbler"

default['cobbler']['cobblerd']['install_method']        = node['cobbler']['install_method']
default['cobbler']['cobblerd']['packages_required']     = ["createrepo", "genisoimage", "syslinux", "yum-utils"]
default['cobbler']['cobblerd']['source']['packages_required'] = ["libcurl4-openssl-dev"]
default['cobbler']['cobblerd']['source']['packages_pip_required'] = ['pycurl'] + ["Cheetah", "netaddr", "simplejson", "urlgrabber", "PyYAML"]
default['cobbler']['cobblerd']['path']                  = "/srv/cobblerd"
default['cobbler']['cobblerd']['user']                  = node['cobbler']['user']
default['cobbler']['cobblerd']['group']                 = node['cobbler']['group']

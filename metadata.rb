name             'test_kitchen_ad_helpers'
maintainer       'Sam Martin'
maintainer_email 'samjackmartin@gmail.com'
license          'Apache v2.0'
description      'Facilitates the setup of a multi-node test setup using Active Directory in Test Kitchen'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'
supports         'windows'
issues_url 'https://github.com/Sam-Martin/test_kitchen_ad_helpers/issues'
source_url 'https://github.com/Sam-Martin/test_kitchen_ad_helpers'

depends 'windows_ad', '>= 0.5.1'

# Install the necessary features using PowerShell so we can make use of
#   Features On Demand rather than relying on the features' install packages
#   being bundled in the vagrant box.
if node['os_version'] >= '6.2'
  [
    'DNS',
    'GPMC',
    'RSAT',
    'AD-Domain-Services'
  ].each do |feature|
    windows_feature feature do
      action :install
      provider :windows_feature_powershell
    end
  end
else
  Chef::Log.error('This version of Windows Server is unsupported by' \
    'test_kitchen_ad_helpers')
end

# Create a contoso.com domain
windows_ad_domain 'contoso.test' do
  action :create
  type 'forest'
  safe_mode_pass 'Passw0rd'
end

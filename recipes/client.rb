
# Find the domain controller IP courtesy of kitchen-nodes
search_query = 'run_list:*test_kitchen_ad_helpers??server*'
domain_controller_ip = search('node', search_query)[0]['ipaddress']

# Set the DNS client
powershell_script 'Set DNS client server to Domain Controller' do
  code <<-EOH

# Find the right interface to set the DNS client server entry for our DC
$SubnetSearch = '#{domain_controller_ip}' -replace '\\.\\d{1,3}$','*'
$Interface = (Get-NetIPAddress | ?{$_.IPAddress -like $SubnetSearch})

$params = @{
  $InterfaceIndex = $Interface.InterfaceIndex
  ServerAddresses = #{domain_controller_ip}
}
Set-DnsClientServerAddress @params

EOH
end

# Join Contoso.com domain
windows_ad_domain 'contoso.test' do
  action :join
  domain_pass 'vagrant'
  domain_user 'vagrant'
  restart true
end

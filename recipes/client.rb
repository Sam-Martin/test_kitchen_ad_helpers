
# Find the domain controller IP courtesy of kitchen-nodes
domain_controller_ip = search(:node, 'run_list:*test_kitchen_ad_helpers??server*')[0]['ipaddress']

# Set the DNS client
powershell_script 'Set DNS client server to Domain Controller' do
	code <<-EOH
$InterfaceIndex = (Get-NetIPAddress | ?{$_.IPAddress -like ('#{domain_controller_ip}' -replace '\\.\\d{1,3}$','*')}).InterfaceIndex;
Set-DnsClientServerAddress -ServerAddresses #{domain_controller_ip} -InterfaceIndex $InterfaceIndex
EOH
end

# Join Contoso.com domain
windows_ad_domain "contoso.test" do
  action :join
  domain_pass "vagrant"
  domain_user "vagrant"
  restart true
end

# Find the domain controller IP courtesy of kitchen-nodes
search_query = 'run_list:*test_kitchen_ad_helpers??server*'
domain_controller_ip = search('node', search_query)[0]['ipaddress']

# Set the DNS client
powershell_script 'Set DNS client server to Domain Controller' do
  code <<-EOH

$SubnetSearch = '#{domain_controller_ip}' -replace '\\.\\d{1,3}$','*'
$Interface = (Get-NetIPAddress | ?{$_.IPAddress -like $SubnetSearch})

$params = @{
  InterfaceIndex = $Interface.InterfaceIndex
  ServerAddresses = "#{domain_controller_ip}"
}
Set-DnsClientServerAddress @params

EOH
end

# Join Contoso.com domain
windows_ad_computer ENV['COMPUTERNAME'] do
  action :join
  domain_pass 'vagrant'
  domain_user 'vagrant'
  domain_name 'contoso.test'
  restart true
end

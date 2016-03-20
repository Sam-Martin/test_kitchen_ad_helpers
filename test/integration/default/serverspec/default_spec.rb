require 'serverspec'

# Required by serverspec
set :backend, :cmd
set :os, family: 'windows'

describe command('([System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain()).Name') do
  its(:stdout) { should eq "contoso.test\n" }
end

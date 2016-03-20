# test_kitchen_ad_helpers [![Build Status](https://travis-ci.org/Sam-Martin/test_kitchen_ad_helpers.svg?branch=master)](https://travis-ci.org/Sam-Martin/test_kitchen_ad_helpers)
A cookbook helper with a kitchen example for multi-node AD integration testing for Test Kitchen.  
This example creates two instances:  

1. A domain controller `default-windows-domaincontroller`
2. A member server `default-windows-2012r2`

# Scenario  
You want to test a cookbook/PowerShell script/etc using test-kitchen, but it requires that the server it's running on is joined to an AD domain.

# Setup  
Copy the following files from this repository into your cookbook's repo (merging files as necessary):  

1. `kitchen.yml`  
2. `test/*`  
3. `Berksfile`   

Add `test_kitchen_ad_helpers` to the `Berksfile`

# Usage
Use the platform named `windows-2012r2` as your test bed. Replace or add to the existing tests in the `default` suite and add a run_list that specifies your cookbook or other kitchen provisioners as you desire!

# Requires
`gem install kitchen-nodes`  

# Author

Author:: Sam Martin (<samjackmartin@gmail.com>)
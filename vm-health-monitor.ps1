# Display report header
Write-Host "Azure VM Health Monitoring Report"
Write-Host (Get-Date)
# Retrieve VM inventory
$vms = Get-AzVM -Status
# Display results
Write-Host ""
Write-Host "=== VM Information ==="
$vms | Select-Object Name, ResourceGroupName, PowerState
# Evaluate healthy VMs
Write-Host ""
Write-Host "=== VM Healthy Results ==="
foreach ($vm in $vms) {
    Write-Host $vm.Name
    if ($vm.PowerState -eq "VM running") {
        Write-Host "$($vm.Name) is healthy."
    }
}
# Evaluate VMs that need attention
Write-Host ""
Write-Host "=== VMs Needing Attention ==="
foreach ($vm in $vms) {
    if ($vm.PowerState -ne "VM running") {
        Write-Host "$($vm.Name) needs attention."
    }
}

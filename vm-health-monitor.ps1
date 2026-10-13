"Azure VM Health Monitoring Report"
(Get-Date)
$vms = Get-AzVM -Status
$vms | Select-Object Name, ResourceGroupName, PowerState
foreach($vm in $vms) {
  Write-Host $vm.Name }
 ($vm.PowerState -eq "VM running") {
    Write-Host "$($vm.Name) is healthy."

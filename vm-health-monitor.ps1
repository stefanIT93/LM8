"Azure VM Health Monitoring Report"
(Get-Date)
$vms = Get-AzVM -Status
$vms | Select-Object Name, ResourceGroupName, PowerState

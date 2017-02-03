
#enable ssh on the cluster and suppress the shell warning. 


#edit the location information "enter cluster to modify"
$cluster = Get-VMHost -Location temp
foreach ($vmhost in $cluster) {
    Get-VMHostService -VMHost $vmhost | Where-Object {$_.Key -eq "TSM"} | Set-VMHostService -policy "on" -Confirm:$false
    Get-VMHostService -VMHost $vmhost | Where-Object {$_.Key -eq "TSM"} | Restart-VMHostService -Confirm:$false
    Get-VMHostService -VMHost $vmhost | Where-Object {$_.Key -eq "TSM-SSH"} | Set-VMHostService -policy "on" -Confirm:$false
    Get-VMHostService -VMHost $vmhost | Where-Object {$_.Key -eq "TSM-SSH"} | Restart-VMHostService -Confirm:$false
 
    Get-VMHost $vmhost| Set-VmHostAdvancedConfiguration -Name UserVars.SuppressShellWarning -Value 1
    Write-Host "Host $vmhost is configured" -ForegroundColor Green
    }
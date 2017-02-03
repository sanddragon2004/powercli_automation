#edit the location information "enter cluster to modify"
$cluster = Get-VMHost -Location UCSD
foreach ($vmhost in $cluster) {
    
	Get-VMhost $vmhost | Get-VMHostNetworkAdapter -VMKernel | Set-VMHostNetworkAdapter -VMotionEnabled $true -confirm:$false
    
    }



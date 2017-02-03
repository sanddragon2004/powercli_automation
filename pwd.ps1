$esxHosts = Get-VMhost
foreach($esx in $esxhosts){
 Get-VirtualSwitch -Name vSwitch0 | Set-VirtualSwitch -Nic vmnic0,vmnic1
}



#Variabels
$cluster="cloud_dev"
$vSwitch="vSwitch0"
$VirtualPortGroup="VM*"

Get-Cluster -Name $cluster | Get-VMHost | Get-VirtualSwitch -Name $vSwitch |
Get-VirtualPortGroup -Name $VirtualPortGroup | Remove-VirtualPortGroup -confirm:$false
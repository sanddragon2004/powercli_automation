#Set mandatory parameters for cluster and csvname
param (
[Parameter(Mandatory=$true)][string]$Cluster,
[Parameter(Mandatory=$true)][string]$CSVName
)

#Get cluster and all host HBA information and change format from Binary to hex
$list = Get-cluster $cluster | Get-VMhost | Get-VMHostHBA -Type FibreChannel | Select VMHost,Device,@{N="WWN";E={"{0:X}" -f $_.PortWorldWideName}} | Sort VMhost,Device

#Go through each row and put : between every 2 digits
foreach ($item in $list){
   $item.wwn = (&{for ($i=0;$i -lt $item.wwn.length;$i+=2)   
                    {     
                        $item.wwn.substring($i,2)   
                    }}) -join':' 
}

#Output CSV to current directory.
$list | export-csv -NoTypeInformation $CSVName
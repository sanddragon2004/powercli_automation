


Import-Csv bulkdns_c.csv | ForEach-Object {Add-DnsServerResourceRecord -Name $_.Name -IPv4Address $_.Attributes  -ZoneName PureTec.purestorage.com -ComputerName prd_ad1 -A}
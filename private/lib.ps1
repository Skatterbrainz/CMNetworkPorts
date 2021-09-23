function Get-CmRolePorts {
	param (
		[parameter(Mandatory=$True)][string][ValidateNotNullOrEmpty()]$Role
	)
	switch ($Role) {
		'AI Update Service Point' {
			@('TCP:443','TCP:1433')
		}
		'SMS Certificate Registration Point' {
			@('')
		}
		'SMS Cloud Proxy Connector' {
			@('TCP:10124-10139','TCP:443','TCP:10140-10155')
		}
		'SMS Component Server' {}
		'SMS Data Warehouse Service Point' {
			@('TCP:1433')
		}
		'SMS Device Management Point' {}
		'SMS Distribution Point' {
			@('TCP:80','TCP:443')
		}
		'SMS DM Enrollment Service' {}
		'SMS Dmp Connector' {}
		'SMS Endpoint Protection Point' {
			@('TCP:80','TCP:1433')
		}
		'SMS Enrollment Server' {
			@('TCP:443','TCP:1433')
		}
		'SMS Enrollment Web Site' {
			@('TCP:443')
		}
		'SMS Fallback Status Point' {
			@('TCP:80')
		}
		'SMS Management Point' {
			@('TCP:10123','TCP:80','TCP:443','TCP:389','UDP:389','TCP:636','UDP:636','TCP:3268','TCP:135','TCP:DYNAMIC','TCP:445')
		}
		'SMS Notification Server' {}
		'SMS Provider' {
			@('TCP:135','UDP:135','TCP:443','TCP:DYNAMIC')
		}
		'SMS Site Server' {
			@('TCP:445','TCP:135','TCP:1433','UDP:135')
		}
		'SMS Site System' {}
		'SMS Software Update Point' {
			@('TCP:80','TCP:8530','TCP:443','TCP:8531')
		}
		'SMS SQL Server' {
			@('TCP:1433')
		}
		'SMS SRS Reporting Point' {
			@('TCP:80','TCP:443')
		}
		'SMS State Migration Point' {
			@('TCP:80','TCP:443','TCP:445')
		}
		'Client' {
			@('TCP:80','TCP:443','TCP:445','TCP:8530','TCP:8530','TCP:10123','TCP:3268','UDP:67','UDP:68','UDP:69','UDP:4011')
		}
		'Exchange Server Connector' {
			@('TCP:5985')
		}
		default {
			@('TCP:80','TCP:443')
		}
	}
}

function Get-PortInfo {
	param (
		[parameter(Mandatory=$True)][string][ValidateNotNullOrEmpty()]$Port
	)
	switch ($Port) {
		'UDP:9'    { 'WOL' }
		'UDP:67'   { 'DHCP' }
		'UDP:68'   { 'DHCP' }
		'UDP:69'   { 'TFTP' }
		'TCP:80'   { 'HTTP' }
		'TCP:135'  { 'RPC Endpoint Mapper' }
		'UDP:135'  { 'RPC Endpoint Mapper' }
		'TCP:389'  { 'LDAP' }
		'UDP:389'  { 'LDAP' }
		'TCP:443'  { 'HTTPS' }
		'TCP:445'  { 'SMB' }
		'TCP:1433' { 'SQL over TCP' }
		'TCP:2701' { 'Remote Control' }
		'TCP:3268' { 'LDAP' }
		'TCP:3389' { 'RDP and RTC' }
		'UDP:4011' { 'BINL' }
		'TCP:4022' { 'SQL Server Service Broker' }
		'TCP:5985' { 'WinRM over HTTP' }
		'TCP:5986' { 'WinRM over HTTPS' }
		'UDP:8004' { 'WinPE Peer cache broadcast' }
		'TCP:8003' { 'WinPE Peer cache download' }
		'TCP:8005' { 'Express Updates' }
		'TCP:8530' { 'HTTP' }
		'TCP:8531' { 'HTTPS' }
		'TCP:10123' { 'Client Notification' }
		'TCP:10124-10139' { 'HTTPS' }
		'TCP:10140-10155' { 'TCP-TLS' }
		'UDP:25536' { 'Wake-up Proxy' }
		'TCP:DYNAMIC' { 'Range of Ports' }
		'UDP:63000-64000' { 'Multicast' }
		default { 'unknown' }
	}
}
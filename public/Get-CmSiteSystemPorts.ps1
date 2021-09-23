<#
.SYNOPSIS
	Get CM Site Systems, Roles and Associated Network Ports
.DESCRIPTION
	Get CM Site Systems, Roles and Associated Network Ports
.PARAMETER SiteCode
	3-character ConfigMgr Site Code
.PARAMETER PrimaryServer
	ConfigMgr Primary Site Server or SMS Provider FQDN
.EXAMPLE
.NOTES
.OUTPUTS
#>
function Get-CmSiteSystemPorts {
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string][ValidateLength(3,3)]$SiteCode,
		[parameter(Mandatory=$True)][string][ValidateNotNullOrEmpty()]$PrimaryServer
	)
	try {
		$ns = "root\sms\site_$SiteCode"
		$query = "select distinct ServerName,RoleName from SMS_SystemResourceList"
		$sitesystems = Get-WmiObject -Query $query -ComputerName $PrimaryServer -Namespace $ns -ErrorAction Stop | Select-Object ServerName,RoleName
		$sitesystems | Foreach-Object {
			$ports = Get-CmRolePorts -Role $_.RoleName
			foreach ($port in $ports) {
				[pscustomobject]@{
					ComputerName = $_.ServerName
					RoleName = $_.RoleName
					Port = $port
					Description = (Get-PortInfo -Port $port)
				}
			}
		}
		$ports = Get-CmRolePorts -Role "Client"
		foreach ($port in $ports) {
			[pscustomobject]@{
				ComputerName = "(Clients)"
				RoleName = "Client"
				Port = $port
				Description = (Get-PortInfo -Port $port)
			}
		}
	}
	catch {
		Write-Error $_.Exception.Message
	}
}
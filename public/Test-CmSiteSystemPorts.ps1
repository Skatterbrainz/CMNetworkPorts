<#
.SYNOPSIS
	Test if Required Ports are open
.DESCRIPTION
	Test if required ports per site system role are open from the local host
.PARAMETER SiteCode
	3-character ConfigMgr Site Code
.PARAMETER PrimaryServer
	ConfigMgr Primary site server or SMS Provider FQDN
.EXAMPLE
	Test-CmSiteSystemPorts -SiteCode "P01" -PrimaryServer "cm01.contoso.local"
.NOTES
.OUTPUTS
#>
function Test-CmSiteSystemPorts {
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string][ValidateLength(3,3)]$SiteCode,
		[parameter(Mandatory=$True)][string][ValidateNotNullOrEmpty()]$PrimaryServer
	)
	$sitelist = Get-CmSiteSystemPorts -SiteCode $SiteCode -PrimaryServer $PrimaryServer
	Write-Host "this needs more work to control the port queries per direction (inbound/outbound)"
	foreach ($item in $sitelist) {
		$server   = $item.ComputerName
		$portdata = $item.Port -split ':'
		$porttype = $portdata[0]
		$portnum  = $portdata[1]
		try {
			if ($porttype -eq 'TCP') {
				Test-NetConnection -ComputerName $server -Port $portnum
			} else {
				Write-Host "test UDP connection to port $portnum"
				#Test-NetConnectionUDP
			}
		}
		catch {
			Write-Error $_.Exception.Message
		}
	}
}
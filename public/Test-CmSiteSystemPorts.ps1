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
		[parameter(Mandatory=$True)][string][ValidateNotNullOrEmpty()]$PrimaryServer,
		[parameter(Mandatory=$False)][string][ValidateSet('Servers','Clients')]$TargetType = 'Servers',
		[parameter(Mandatory=$False)][string][ValidateSet('Basic','Advanced')]$Level = 'Basic'
	)
	$sitelist = Get-CmSiteSystemPorts -SiteCode $SiteCode -PrimaryServer $PrimaryServer
	Write-Host "this needs more work to control the port queries per direction (inbound/outbound)"
	$pass = @()
	$fail = @()
	foreach ($item in $sitelist) {
		$server   = $item.ComputerName
		if (($TargetType -eq 'Servers') -and ($server -ne '(Clients)')) {
			$portdata = $item.Port -split ':'
			$porttype = $portdata[0]
			$portnum  = $portdata[1]
			$portdesc = $item.Description
			if ($Level -eq 'Advanced') {
				if ($portnum -ne 'DYNAMIC') {
					if ($portnum -like '*-*') {
						# expand port numbers within range
						$portnums = Invoke-Expression $($portnum.Replace("-",".."))
					} else {
						# check an explicit port
					}
				} else {
					Write-Verbose "testing of dynamic ports is not yet supported"
				}
			} else {
				if (($portnum -notlike '*-*') -and ($portnum -ne 'DYNAMIC')) {
				}
			}
			if (($portnum -notlike '*-*') -and ($portnum -ne 'DYNAMIC')) {
				$test = "$server,$portnum"
				try {
					if (($pass -notcontains $test) -and ($fail -notcontains $test)) {
						if ($porttype -eq 'TCP') {
							if ((Test-NetConnection -ComputerName $server -Port $portnum -ErrorAction SilentlyContinue).TcpTestSucceeded) {
								$pass += $test
								$stat = 'pass'
							} else {
								$fail += $test
								$stat = 'fail'
							}
						} else {
							Write-Host "test UDP connection to port $portnum"
							#Test-NetConnectionUDP
							$stat = 'fail'
						}
						[pscustomobject]@{
							Status      = $stat
							Destination = $server
							RoleName    = $item.RoleName
							Source      = $env:COMPUTERNAME
							Port        = $portnum
							Type        = $porttype
							PortInfo    = $portdesc
						}
					} else {
						Write-Verbose "already tested: $server $($item.port)"
					}
				}
				catch {
					Write-Error $_.Exception.Message
					$fail += $test
				}	
			} else {
				if ($portnum -eq 'DYNAMIC') {
					Write-Warning "testing of dynamic ports is not yet supported"
				} else {
					Write-Verbose "skipping port range: $($item.port)"
				}
			}
		} elseif ($TargetType -eq 'Clients') {
			Write-Verbose "skipping clients for now"
		}
	}
}
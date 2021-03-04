Add-Type -AssemblyName System.ServiceProcess

function Write-ColorizedServiceLine {
	param (
		[Parameter(Mandatory = $true, Position = 1)][String] $color,
		[Parameter(Mandatory = $true, Position = 2)] $service
	)

	$defaultColor = $Global:PSColor.Service.Default.Color;	

	Write-Host ("{0,-8}" -f $_.Status) -ForegroundColor $color -NoNewline;
	Write-Host (
		" {0,-28} {1,-59}" -f
		(Get-StringCharacters $_.Name 28),
		(Get-StringCharacters $_.DisplayName 58)
	) -ForegroundColor $defaultColor;
}

function Write-ServiceHeader {

	if ($Script:showHeader -eq $false) {
		return;
	}

	Write-Host "Status   Name               DisplayName";
	Write-Host "------   ----               -----------";

	$Script:showHeader = $false;
}

function Write-Service {
	param (
		[Parameter(Mandatory = $true, Position = 1)] $service
	)

	if ($service.Status -eq 'Stopped') {
		Write-ColorizedServiceLine $Global:PSColor.Service.Status.Stopped.Color $service;
	} elseif ($service.Status -eq 'Running') {
		Write-ColorizedServiceLine $Global:PSColor.Service.Status.Running.Color $service;
	} else {
		Write-ColorizedServiceLine $Global:PSColor.Service.Default.Color $service;
	}
}

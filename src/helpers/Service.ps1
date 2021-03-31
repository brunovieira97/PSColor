Add-Type -AssemblyName System.ServiceProcess

function Write-ColorizedServiceLine {
	param (
		[Parameter(Mandatory = $true, Position = 1)][String] $color,
		[Parameter(Mandatory = $true, Position = 2)] $service
	)

	$defaultColor = $Global:ColorSettings.Service.DefaultColor;	

	Write-Host ("{0,-8}" -f $_.Status) -ForegroundColor $color -NoNewline;
	Write-Host (
		" {0,-28} {1,-59}" -f
		(Get-StringCharacters $_.Name 28),
		(Get-StringCharacters $_.DisplayName 58)
	) -ForegroundColor $defaultColor;
}

function Write-ServiceHeader {

	if (($Global:ColorSettings.Service.Header.Visible -eq $false) -or ($Script:showHeader -eq $false)) {
		return;
	}

	Write-Host;

	$textColor = $Global:ColorSettings.Service.Header.TextColor;
	$separatorsColor = $Global:ColorSettings.Service.Header.SeparatorsColor;

	Write-Host "Status   Name                         DisplayName" -ForegroundColor $textColor;
	Write-Host "------   ----                         -----------" -ForegroundColor $separatorsColor;

	$Script:showHeader = $false;
}

function Write-Service {
	param (
		[Parameter(Mandatory = $true, Position = 1)] $service
	)

	Write-ServiceHeader;

	if ($service.Status -eq 'Stopped') {
		Write-ColorizedServiceLine $Global:ColorSettings.Service.Status.Stopped.Color $service;
	} elseif ($service.Status -eq 'Running') {
		Write-ColorizedServiceLine $Global:ColorSettings.Service.Status.Running.Color $service;
	} else {
		Write-ColorizedServiceLine $Global:ColorSettings.Service.DefaultColor $service;
	}
}

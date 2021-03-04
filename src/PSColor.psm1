. "$PSScriptRoot\config\Default.ps1"
. "$PSScriptRoot\util\String.ps1"
. "$PSScriptRoot\helpers\File.ps1"
. "$PSScriptRoot\helpers\Service.ps1"

$Script:showHeader = $true;

function Out-Default {
	[CmdletBinding(HelpUri = 'http://go.microsoft.com/fwlink/?LinkID=113362', RemotingCapability = 'None')]
	param(
		[switch] ${Transcript},
		[Parameter(Position = 0, ValueFromPipeline = $true)][PSObject] ${InputObject}
	)

	begin {
		try {
			$outBuffer = $null

			if ($PSBoundParameters.TryGetValue('OutBuffer', [ref] $outBuffer)) {
				$PSBoundParameters['OutBuffer'] = 1;
			}

			$wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Core\Out-Default', [System.Management.Automation.CommandTypes]::Cmdlet);
			$scriptCmd = {& $wrappedCmd @PSBoundParameters }

			$steppablePipeline = $scriptCmd.GetSteppablePipeline();
			$steppablePipeline.Begin($PSCmdlet);
		} catch {
			throw
		}
	}
	
	process {
		try {
			if (($_ -is [System.IO.DirectoryInfo]) -or ($_ -is [System.IO.FileInfo])) {
				Write-File $_;
			} elseif ($_ -is [System.ServiceProcess.ServiceController]) {
				Write-Service $_;
			} elseif ($_ -is [Microsoft.Powershell.Commands.MatchInfo]) {
				Write-MatchInfo $_;
			} else {
				$steppablePipeline.Process($_);
			}
		} catch {
			throw
		}
	}

	end {
		try {
			$Script:showHeader = $true;
			$steppablePipeline.End();
		} catch {
			throw
		}
	}
}

Export-ModuleMember -Function Out-Default;

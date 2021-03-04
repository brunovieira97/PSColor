function Write-Context {
	param (
		[Parameter(Mandatory = $True)] $display,
		[Parameter(Mandatory = $True)] $fileName,
		[Parameter(Mandatory = $True)] $start
	)

	$display | ForEach-Object {
		Write-Host "  ${fileName}" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Path.Color -NoNewLine;
        Write-Host ":" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Default.Color -NoNewLine;
        Write-Host "$start" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.LineNumber.Color -NoNewLine;
        Write-Host ":" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Default.Color -NoNewLine;
        write-host "$_" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Line.Color;
        
		$start++
	}
}

function Write-Match {
	param (
        [Parameter(Mandatory = $True, Position = 1)] $match
    )

	Write-Host '> ' -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Default.Color -NoNewLine;
    Write-Host $match.RelativePath($pwd) -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Path.Color -NoNewLine;
    Write-Host ':' -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Default.Color -NoNewLine;
    Write-Host $match.LineNumber -ForegroundColor $Global:ColorSettings.MatchInfo.Match.LineNumber.Color -NoNewLine;
    Write-Host ':' -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Default.Color -NoNewLine;
    Write-Host $match.Line -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Line.Color;
}

function Write-MatchInfo {
	param (
        [Parameter(Mandatory = $True, Position = 1)] $match
    )

	if ($match.Context) {
		Write-Context $match.Context.DisplayPreContext $match.RelativePath($pwd) ($match.LineNumber - $match.Context.DisplayPreContext.Count);
	}

	Write-Match $match;

	if ($match.Context) {
		Write-Context $match.Context.DisplayPostContext $match.RelativePath($pwd) ($match.LineNumber + 1);
	}
}

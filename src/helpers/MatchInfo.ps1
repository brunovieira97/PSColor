function Write-Context {
	param (
		[Parameter(Mandatory = $True)] $display,
		[Parameter(Mandatory = $True)] $fileName,
		[Parameter(Mandatory = $True)] $start
	)

	$display | ForEach-Object {
		if ($fileName -ne 'InputStream') {
			Write-Host "${fileName}" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Path.Color -NoNewLine;
			Write-Host ":" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.DefaultColor -NoNewLine;
		}

		Write-Host -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.LineNumber.Color -NoNewline (
			"{0, 4}" -f
			$start
		);
		
        Write-Host ":" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.DefaultColor -NoNewLine;
        write-host "$_" -ForegroundColor $Global:ColorSettings.MatchInfo.NoMatch.Line.Color;
        
		$start++
	}
}

function Write-Match {
	param (
        [Parameter(Mandatory = $True, Position = 1)] $match
    )

	if ($match.RelativePath($pwd) -ne 'InputStream') {
		Write-Host $match.RelativePath($pwd) -ForegroundColor $Global:ColorSettings.MatchInfo.Match.Path.Color -NoNewLine;
		Write-Host ':' -ForegroundColor $Global:ColorSettings.MatchInfo.Match.DefaultColor -NoNewLine;
	}

	Write-Host -ForegroundColor $Global:ColorSettings.MatchInfo.Match.LineNumber.Color -NoNewline (
		"{0, 4}" -f
		$match.LineNumber
	);

    Write-Host ':' -ForegroundColor $Global:ColorSettings.MatchInfo.Match.DefaultColor -NoNewLine;
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

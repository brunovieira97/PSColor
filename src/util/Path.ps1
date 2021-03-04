
function Get-ShortenedPath {
	param (
		[Parameter(Mandatory = $true, Position = 1)] [String] $path
	)

	$result = $path;

	if (($Global:ColorSettings.General.Path.ShortenUserFolder -eq $true) -and ($path.StartsWith($env:USERPROFILE))) {
		$result = $path.Replace($env:USERPROFILE, "~");
	}

	return $result;
}

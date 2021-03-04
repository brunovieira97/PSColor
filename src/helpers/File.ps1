function Get-FileLength {
	param (
		[Parameter(Mandatory = $true)] $file
	)

	$length = $null;

	if ($file -isnot [System.IO.DirectoryInfo]) {
		$length = $file.length;
	}

	if ($null -eq $length) {
		return "";
	} elseif ($length -ge 1PB) {
		return ($length / 1PB).ToString("F") + 'PB';
	} elseif ($length -ge 1TB) {
		return ($length / 1TB).ToString("F") + 'TB';
	} elseif ($length -ge 1GB) {
		return ($length / 1GB).ToString("F") + 'GB';
	} elseif ($length -ge 1MB) {
		return ($length / 1MB).ToString("F") + 'MB';
	} elseif ($length -ge 1KB) {
		return ($length / 1KB).ToString("F") + 'KB';
	}

	return $length.ToString() + 'B ';
}

function Write-ColorizedFileLine {
	param (
		[String] $color,
		[Parameter(Mandatory = $true)] $file
	)

	Write-Host -ForegroundColor $color (
		"{0,-7} {1,25} {2,10} {3}" -f 
		$file.Mode,
		([String]::Format("{0,10}  {1,8}", $file.LastWriteTime.ToString("d"), $file.LastWriteTime.ToString("t"))),
		(Get-FileLength $file),
		$file.Name
	);
}

function Write-FileHeader {
	param (
		[Parameter(Mandatory = $true, Position = 1)] [String] $directory
	)

	$currentDirectory = (Get-Location).Path;

	Write-Host;
	Write-Host "    Directory: " -NoNewline;
	Write-Host "$currentDirectory";

	Write-Host;
	Write-Host "Mode                LastWriteTime     Length Name";
	Write-Host "----                -------------     ------ ----";

	$Script:showHeader = $false;
}

function Write-File {
	param (
		[Parameter(Mandatory = $true, Position = 1)] [System.IO.FileSystemInfo] $file
	)

	$regexOptions = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase);

	$binary = New-Object System.Text.RegularExpressions.Regex($Global:PSColor.File.Type.Binary.RegEx, $regexOptions);
	$code = New-Object System.Text.RegularExpressions.Regex($Global:PSColor.File.Type.Code.RegEx, $regexOptions);
	$compressed = New-Object System.Text.RegularExpressions.Regex($Global:PSColor.File.Type.Compressed.RegEx, $regexOptions);
	$text = New-Object System.Text.RegularExpressions.Regex($Global:PSColor.File.Type.Text.RegEx, $regexOptions);
	$hidden = New-Object System.Text.RegularExpressions.Regex($Global:PSColor.File.Type.Hidden.RegEx, $regexOptions);

	if ($file -is [System.IO.DirectoryInfo]) {
		$currentDirectory = $file.Parent.FullName;
	} else {
		$currentDirectory = $file.DirectoryName;
	}

	Write-FileHeader $currentDirectory;

	if ($hidden.IsMatch($file.Name)) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Hidden.Color $file;
	} elseif ($file -is [System.IO.DirectoryInfo]) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Directory.Color $file;
	} elseif ($binary.IsMatch($file.Name)) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Binary.Color $file;
	} elseif ($code.IsMatch($file.Name)) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Code.Color $file;
	} elseif ($compressed.IsMatch($file.Name)) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Compressed.Color $file;
	} elseif ($text.IsMatch($file.Name)) {
		Write-ColorizedFileLine $Global:PSColor.File.Type.Text.Color $file;
	} else {
		Write-ColorizedFileLine $Global:PSColor.File.Default.Color $file;
	}
}

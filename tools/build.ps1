<#
	.SYNOPSIS
	Generates a manifest for the module
	and bundles all of the module source files
	and manifest into a distributable ZIP file.
#>

param (
	[Switch] $GenerateZip
)

$ErrorActionPreference = 'Stop';

$releaseFolderName = 'release\Color';
$sourceFolderName = 'src';

$scriptPath = Split-Path -LiteralPath $(
	if ($PSVersionTable.PSVersion.Major -ge 3) {
		$PSCommandPath
	} else {
		& { $MyInvocation.ScriptName }
	}
);

$sourcePath = (Join-Path (Split-Path $scriptPath) $sourceFolderName);
$releasePath = (Join-Path (Split-Path $scriptPath) $releaseFolderName);

if (Test-Path -Path $releasePath) {
    Remove-Item -Path $releasePath -Force -Recurse;
}

New-Item -ItemType Directory -Path $releasePath | Out-Null;

Write-Host 'Creating release archive...';

# Copy the distributable files to the dist folder.
Copy-Item -Path "$sourcePath\*" -Destination $releasePath -Recurse;

if ($GenerateZip) {
	# Requires .NET 4.5
	[Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem') | Out-Null;

	$zipFileName = Join-Path -Path ([System.IO.Path]::GetDirectoryName($releasePath)) -ChildPath 'Color.zip';

	# Overwrite the ZIP if it already already exists.
	if (Test-Path -Path $zipFileName) {
		Remove-Item -Path $zipFileName -Force;
	}

	$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal;
	$includeBaseDirectory = $false;

	[System.IO.Compression.ZipFile]::CreateFromDirectory($releasePath, $zipFileName, $compressionLevel, $includeBaseDirectory);

	Move-Item -Path $zipFileName -Destination $releasePath -Force;
}

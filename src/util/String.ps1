# Functions for dealing with Strings

function Get-StringCharacters {
	param (
		[Parameter(Mandatory = $true, Position = 1)] [String] $string,
		[Parameter(Mandatory = $true, Position = 2)] [Int32] $length
	)

	if ($string.Length -gt $length) {
		return $string.Substring(0, ($length - 3)) + '...';
	}
	
	return $string;
}

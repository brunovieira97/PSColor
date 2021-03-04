@{
	# Script module or binary module file associated with this manifest.
	RootModule = 'PSColor.psm1'

	# Version number of this module.
	ModuleVersion = '1.0.0.0'

	# ID used to uniquely identify this module
	GUID = 'f521f5dc-fd57-4b62-ade3-cba7b4e3fafe'

	# Author of this module
	Author = 'Bruno Vieira'

	# Copyright statement for this module
	Copyright = '(c) 2021 Bruno Vieira. All rights reserved.'

	# Description of the functionality provided by this module
	Description = 'Fork of Davlind''s PSColor module, providing basic highlighting for default PowerShell Cmdlets.'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.1'

	# Functions to export from this module
	FunctionsToExport = @(
		"Out-Default"
	)

	# Cmdlets to export from this module
	CmdletsToExport = @()

	# Variables to export from this module
	VariablesToExport = '*'

	# Aliases to export from this module
	AliasesToExport = @()
}

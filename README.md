Color
=======

A fork of Davlind's PSColor Module, providing color highlighting for PowerShell Cmdlets in a native and interoperable way.

Color highlighting is achieved by overriding Out-Default, and intercepting specific output types. Currently supported outputs:

* FileInfo & DirectoryInfo objects (Get-ChildItem, dir, ls etc.)
* ServiceController objects (Get-Service)
* MatchInfo objects (Select-String etc.)

## Disclaimer

Even though this is a fork, publishing to PowerShell Gallery requires a new, unique name for this module. Based on this, I renamed the module to "Color".

This work is still heavily based on Davlind's original PSColor, and the LICENSE still contains his name explicitly as this is still a fork, technically.

## Installation

Install by downloading Color.zip from the [Releases](github.com/brunovieira97/PSColor/releases) page and extracting it to a folder named `Color` in any of your PowerShell module paths. (Run `$env:PSModulePath` to see your paths.)

If you want Color to be ran automatically you can add `Import-Module Color` to your PowerShell Profile. To locate your profile, run `$profile`

## Configuration

You can configure Color by overriding the values of colors, patterns etc. Configurations should be added after `Import-Module Color` in your PowerShell profile. The [default configuration](src/config/Default.ps1) looks like:

```powershell
$global:ColorSettings = @{
    File = @{
        Default = @{
            Color = 'White'
        }
        Code    = @{
            Color = 'Magenta';
            Pattern = '\.(java|c|cpp|cs|js|css|html)$'
        }
    }
    Service = @{
        Default = @{
            Color = 'White'
        }
        Running = @{
            Color = 'DarkGreen'
        }
        Stopped = @{
            Color = 'DarkRed'
        }     
    }
    Match = @{
        Default = @{
            Color = 'White'
        }
        Path    = @{
            Color = 'Cyan'
        }
    }
    NoMatch = @{
        Default	= @{
            Color = 'White'
        }
        Path    = @{
            Color = 'Cyan'
        }
    }
}
```

E.g. if you would like to override the red color for Executables, in favour of blue; you could add the following to your PowerShell profile:

```powershell
$Global:ColorSettings.File.Executable.Color = 'Blue'
```

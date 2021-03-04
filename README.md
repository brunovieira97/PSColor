PSColor
=======

Provides color highlighting for some basic PowerShell output. It currently rewrites "Out-Default" to colorize:

* FileInfo & DirectoryInfo objects (Get-ChildItem, dir, ls etc.)
* ServiceController objects (Get-Service)
* MatchInfo objects (Select-String etc.)

## Installation

Install by downloading PSColor.zip from the [Releases](github.com/brunovieira97/PSColor/releases) page and extracting it to a folder named `PSColor` in any of your PowerShell module paths. (Run `$env:PSModulePath` to see your paths.)

If you want PSColor to be ran automatically you can add `Import-Module PSColor` to your PowerShell Profile. To locate your profile, run `$profile`

## Configuration

You can configure PSColor by overriding the values of colors, patterns etc. Configurations should be added after `Import-Module PSColor` in your PowerShell profile. The [default configuration](src/config/Default.ps1) looks like:

```powershell
$global:PSColor = @{
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
$global:PSColor.File.Executable.Color = 'Blue'
```

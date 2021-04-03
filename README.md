Color
=======

A fork of Davlind's PSColor Module, providing color highlighting for PowerShell Cmdlets in a native and interoperable way.

Color highlighting is achieved by overriding Out-Default, and intercepting specific output types. Currently supported outputs:

* FileInfo & DirectoryInfo objects (Get-ChildItem and its aliases)
* ServiceController objects (Get-Service)
* MatchInfo objects (Select-String)

If you'd like a new type of data supported, please feel free to create an Issue or contribute with a PR!

## Disclaimer

While this is a fork, publishing to PowerShell Gallery requires a new, unique name for this module. Based on this, I renamed it to "Color".

This work is still heavily based on Davlind's original PSColor, and the LICENSE contains his name explicitly.

## Why fork PSColor?

I've been using PSColor for a long time now, and with that, feature requests arrive, as well as need for customizability.

After taking a look at the original project's issues, it looks abandoned, having no modifications for years now. What better way for having my own requests implemented (and why not other users' as well?)? A fork it is, then!

## Installation

Color is available on [PowerShell Gallery](https://www.powershellgallery.com/packages/Color) and can be installed through PowerShellGet. To do so, run the following Cmdlet on PowerShell:

```powershell
Install-Module -Name Color -AllowClobber
```

If you want Color to be ran automatically, add it to your PowerShell Profile:

```powershell
Import-Module <path to local git repo>/Color/Color.psm1
```

I'm not dealing with GitHub releases yet, but that's planned for the future. In the meantime, if you wish to do a manual install and avoid usage of PS Gallery and PSGet, just clone the repo and run the [build script](tools/build.ps1) and import the module on your Profile. Also, you can place it in one of your Module Paths (`$env:PSModulePath` has the directory list).

## Configuration

You can configure Color by overriding the values of colors, patterns etc. Configurations should be added after `Import-Module Color` in your PowerShell profile. The [default configuration](src/config/Default.ps1) looks like:

```powershell
$global:ColorSettings = @{
    File = @{
        DefaultColor = "Gray";
	Types = @{
            Code = @{
	        Color   = "Magenta";
	        Pattern = "\.(java|c|cpp|cs|js|css|html)$";
            }
	}
    }
    Service = @{
        DefaultColor = "White";
        Status = @{
            Running = @{
                Color = "DarkGreen";
            }
            Stopped = @{
                Color = "DarkRed";
            }
        }
    }
    Match = @{
        DefaultColor = "Gray";
        Path         = @{
            Color = "Cyan";
        }
    }
    NoMatch = @{
        DefaultColor = "Gray";
        Path         = @{
            Color = "Cyan";
        }
    }
}
```

### Colors

Colors can be set based on their names as well as their hexadecimal codes. When using names, you're limited to the standard 16 colors as observed on Conhost Properties window. When setting the hexadecimal code, use a string and don't forget the `#`!

So, let's say you want to use Blue for source code files instead of the default one (Magenta). All you have to do is add this to your PowerShell Profile:

```powershell
# Using the color name
$Global:ColorSettings.File.Types.Code.Color = "Blue";

# Using the hexadecimal code
$Global:ColorSettings.File.Types.Code.Color = "#3b79ff";
```

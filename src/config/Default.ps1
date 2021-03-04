# Default configuration

$Global:ColorSettings = @{
	General = @{
		Path = @{
			ShortenUserFolder = $true;
		}
	}
	File = @{
		Default = @{
			Color = "White";
		}
		Header = @{
			Hidden = $true;
			Text = @{
				Color = "White";
			}
			Separators = @{
				Color = "White";
			}
		}
		Path = @{
			Hidden = $true;
			Title = @{
				Color = "White";
			}
			Text = @{
				Color = "White";
			}
		}
		Type = @{
			Directory = @{
				Color = "Yellow";
			}
			SymbolicLink = @{
				Color = "Blue";
				ShowTarget = $true;
			}
			Hidden = @{
				Color = "DarkGray";
				RegEx = "^\.";
			}
			Binary = @{
				Color = "DarkCyan";
				RegEx = "\.(exe|jar|msi|pdf|war)$";
			}
			Code = @{
				Color = "Magenta";
				RegEx = "\.(bat|c|cmd|cpp|cs|css|dfm|dpr|h|html|java|js|json|pas|php|pl|ps1|psm1|py|rb|reg|sh|sql|swift|toml|ts|vb|vbs|yaml|yml)$";
			}
			Compressed = @{
				Color = "Cyan";
				RegEx = "\.(7z|gz|rar|tar|zip)$";
			}
			Text = @{
				Color = "Red";
				RegEx = "\.(cfg|conf|config|csv|ini|log|markdown|md|txt|xml)$";
			}
		}
	}
	Service = @{
		Default = @{
			Color = "White";
		}
		Header = @{
			Hidden = $false;
			Text = @{
				Color = "White";
			}
			Separators = @{
				Color = "White";
			}
		}
		Status = @{
			Running = @{
				Color = "DarkGreen";
			}
			Stopped = @{
				Color = "DarkRed";
			}
		}
	}
	MatchInfo = @{
		Match = @{
			Default = @{
				Color = "White";
			}
			Path = @{
				Color = "Cyan";
			}
			LineNumber = @{
				Color = "Yellow";
			}
			Line = @{
				Color = "White";
			}
		}
		NoMatch = @{
			Default = @{
				Color = "White";
			}
			Path = @{
				Color = "Cyan";
			}
			LineNumber = @{
				Color = "Yellow";
			}
			Line = @{
				Color = "White";
			}
		}
	}
};

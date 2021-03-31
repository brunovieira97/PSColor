# Default configuration

$Global:ColorSettings = @{
	General = @{
		ShortenUserFolder = $true;
	}
	File = @{
		DefaultColor = "Gray";
		Header = @{
			Visible = $true;
			TextColor = "DarkGray";
			SeparatorsColor = "DarkGray";
		}
		Path = @{
			Visible = $false;
			TitleColor = "DarkGray";
			TextColor = "Gray";
		}
		Types = @{
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
		DefaultColor = "Gray";
		Header = @{
			Visible = $true;
			TextColor = "DarkGray";
			SeparatorsColor = "DarkGray";
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
			DefaultColor = "Gray";
			Path = @{
				Color = "DarkGreen";
			}
			LineNumber = @{
				Color = "DarkGreen";
			}
			Line = @{
				Color = "Gray";
			}
		}
		NoMatch = @{
			DefaultColor = "Gray";
			Path = @{
				Color = "Cyan";
			}
			LineNumber = @{
				Color = "DarkGray";
			}
			Line = @{
				Color = "Gray";
			}
		}
	}
};

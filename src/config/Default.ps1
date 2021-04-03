# Default configuration

$Global:ColorSettings = @{
	General = @{
		ShortenUserFolder = $true;
	}
	File = @{
		DefaultColor = "#cccccc";
		Header = @{
			Visible = $true;
			TextColor = "#767676";
			SeparatorsColor = "#767676";
		}
		Path = @{
			Visible = $false;
			TitleColor = "#767676";
			TextColor = "#cccccc";
		}
		Types = @{
			Directory = @{
				Color = "#f9f1a5";
			}
			SymbolicLink = @{
				Color = "#3b79ff";
				ShowTarget = $true;
			}
			Hidden = @{
				Color = "#767676";
				RegEx = "^\.";
			}
			Binary = @{
				Color = "#3a96dd";
				RegEx = "\.(exe|jar|msi|pdf|war)$";
			}
			Code = @{
				Color = "#b4009f";
				RegEx = "\.(bat|c|cmd|cpp|cs|css|dfm|dpr|h|html|java|js|json|pas|php|pl|ps1|psm1|py|rb|reg|sh|sql|swift|toml|ts|vb|vbs|yaml|yml)$";
			}
			Compressed = @{
				Color = "#61d6d6";
				RegEx = "\.(7z|gz|rar|tar|zip)$";
			}
			Text = @{
				Color = "#e74856";
				RegEx = "\.(cfg|conf|config|csv|ini|log|markdown|md|txt|xml)$";
			}
		}
	}
	Service = @{
		DefaultColor = "#cccccc";
		Header = @{
			Visible = $true;
			TextColor = "#767676";
			SeparatorsColor = "#767676";
		}
		Status = @{
			Running = @{
				Color = "#13a10e";
			}
			Stopped = @{
				Color = "#c50f1f";
			}
		}
	}
	MatchInfo = @{
		Match = @{
			DefaultColor = "#cccccc";
			Path = @{
				Color = "#13a10e";
			}
			LineNumber = @{
				Color = "#13a10e";
			}
			Line = @{
				Color = "#cccccc";
			}
		}
		NoMatch = @{
			DefaultColor = "#cccccc";
			Path = @{
				Color = "#61d6d6";
			}
			LineNumber = @{
				Color = "#767676";
			}
			Line = @{
				Color = "#cccccc";
			}
		}
	}
};

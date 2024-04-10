# Variables
$DOTS_DIR = "$HOME\Projects\dotfiles"
$CONFIG = "$DOTS_DIR\powershell\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$VIM_CONFIG = "$DOTS_DIR\nvim\.config\nvim\"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#oh-my-posh init powershell --config 'C:/Users/cljackso/Posh/cljackso.omp.json' | Invoke-Expression

# Define functions for the commands
function Open-Vim { nvim @args }
function Show-GitStatus { git status }
function GoTo-Dots { Set-Location -Path $DOTS_DIR }

# Create aliases for these functions
if (-not (Get-Alias -Name vim -ErrorAction SilentlyContinue)) {
    New-Alias -Name vim Open-Vim
}
if (-not (Get-Alias -Name gs -ErrorAction SilentlyContinue)) {
	New-Alias -Name gs Show-GitStatus
}
if (-not (Get-Alias -Name dots -ErrorAction SilentlyContinue)) {
	New-Alias -Name dots GoTo-Dots
}

function Copy-ProfileToLocation {
    $SourcePath = $CONFIG

    try {

        # Check if the source file exists
        if (Test-Path $SourcePath) {
            # Copy the profile to the $PROFILE location
            Copy-Item -Path $SourcePath -Destination $PROFILE -Force
            Write-Host "Profile copied successfully to $PROFILE"
	    
	    # Source PROFILE
	    . $PROFILE
        } else {
            Write-Host "The source profile path does not exist."
        }
    } catch {
        Write-Host "An error occurred: $_"
    }
}

function Copy-NeoVimProfileToLocation {
	$SourcePath = $VIM_CONFIG
	$DestinationPath = "$HOME\AppData\Local\"

  try {

# Check if the source file exists
    if (Test-Path $SourcePath) {
# Copy the profile to the $DestinationPath location
      Copy-Item -Path $SourcePath -Destination $DestinationPath -Force -Recurse
        Write-Host "NeoVim copied successfully to $DestinationPath"
    } else {
      Write-Host "The source vim profile path does not exist."
    }
  } catch {
    Write-Host "An error occurred: $_"
  }
}

function Stow {
	Copy-ProfileToLocation
	Copy-NeoVimProfileToLocation
}

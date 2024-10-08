# Variables
$DOTS_DIR = "$HOME\Projects\dotfiles"
$CONFIG = "$DOTS_DIR\pwsh\PowerShell\Microsoft.PowerShell_profile.ps1"
$VIM_CONFIG = "$DOTS_DIR\nvim\.config\nvim\"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}

oh-my-posh init powershell | Invoke-Expression

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

function Export-WingetList {
  $ExportFile = "$DOTS_DIR\winget_file"
  winget list --source winget | Out-File -FilePath $ExportFile
}

function Get-Path {
    $path = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
    return $path
}

function Update-Path {
    param (
      [string]$pathToAdd
    )

    $path = Get-Path

    if ($path -notlike "*$pathToAdd*") {
        # Backup Path
        $backupFilePath = "$env:USERPROFILE\path.bak"
        $path | Out-File -FilePath $backupPathFile

        $newPath = "$path;$pathToAdd"
        [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
        Write-Host "Added $pathToAdd to PATH. Please restart PowerShell to apply changes."
        Write-Host "See $backupPathFile if changes need to be reverted."
    } else {
        Write-Output "$NewPath is already in the PATH variable. Use 'Get-Path' to verify current PATH."
    }
}

function Ensure-ClangInPath {
    # Check if 'clang.exe' is in the PATH
    $clangInPath = $false
    $clangPath = "C:\Program Files\LLVM\bin"
    $backupPathFile = "$DOTS_DIR\path.bak"
    $path = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)

    # Splitting the path to check each directory
    $directories = $path.Split(';')
    foreach ($dir in $directories) {
        if (Test-Path "$dir\clang.exe") {
            $clangInPath = $true
            break
        }
    }

    # Proceed if clang is not in PATH
    if (-not $clangInPath) {
        if (Test-Path "$clangPath\clang.exe") {
            # Back up current path to local file
            $backupFilePath = "$env:USERPROFILE\path.bak"
            $path | Out-File -FilePath $backupPathFile

            # Adding LLVM bin to PATH
            $newPath = "$path;$clangPath"
            [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
            Write-Host "Added clang to PATH. Please restart PowerShell to apply changes."
        } else {
            Write-Host "Error: clang is not installed at $clangPath."
        }
    } else {
      Write-Host "clang is already in the PATH."
    }
}

function Format-GitCheckoutCommand {
  param (
      [string]$branchName = 'release'
      )

    # Get the status from git
    $gitStatus = git status --porcelain

    # Filter out only the unstaged files
    $unstagedFiles = $gitStatus | Where-Object { $_ -match '^\?\? |^UU |^AA ' } | ForEach-Object {
    # Extract the file path
      ($_.Trim() -split '\s+', 2)[1]
    }

    # Format the git checkout command
  $gitCommand = "git checkout origin/$branchName " + ($unstagedFiles -join ' ')

    # Output the formatted command
    Write-Output $gitCommand
}

function Get-WeekNum {
  Write-Output ([cultureinfo]::InvariantCulture.Calendar.GetWeekOfYear((Get-Date), [System.Globalization.CalendarWeekRule]::FirstDay, [System.DayOfWeek]::Sunday))
}

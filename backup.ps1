$ProjectFolder = $PSScriptRoot      # Gets project path

# List with folders
$DataFolder = "$ProjectFolder\data"
$BackupFolder = "$ProjectFolder\backup"
$LogFolder = "$ProjectFolder\logs"


function Write-Log {                # Writes to logg function
    param($Message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path "$ProjectFolder\Logs\logg.txt" -Value "$timestamp - $Message"
}

function Copy-Backup {              # Copies files from source to destination
    param($Source, $Destination)

    try {
        $files = Get-ChildItem -Path $Source -File

        foreach ($file in $files) {
            Copy-Item -Path $file.FullName -Destination $Destination -ErrorAction Stop

            Write-Host "File $(file.Name) has been copied"
            Write-Log "File $(file.Name) has been copied"
        }
    }
    catch {
        Write-Host "Error when copying"
        Write-Log "Error when copying: $($_.Exception.Message)"
    }
}

function Test-Backup {              # Checks if backup was successful
    param($Source, $Destination)
    $files = Get-ChildItem -Path $Source -File

    foreach ($file in $files) {
        if (Test-Path "$Destination\$($file.Name)") {
            Write-Host "$($file.Name) exists in backup"
            Write-Log "$($file.Name) exists in backup"
        }
        else {
            Write-Host "$($file.name) is missing"
            Write-Log "$($file.Name) is missing"
        }
    }
}

# Main program
Write-Host "Starting backup..."

# Start backup
Copy-Backup -Source $Datafolder -Destination $BackupFolder

#Check backup
Test-Backup -Source $DataFolder -Destination $BackupFolder

Write-host "Backup completed."
$ProjectFolder = $PSScriptRoot      # Gets project path

# List with folders
$DataFolder = "$ProjectFolder\data",
$BackupFolder = "$ProjectFolder\backup",
$LogFolder = "$ProjectFolder\logs"


function Write-Log {                # Writes to logg function
    param($Message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path "$ProjectFolder\Logs\logg.txt" -Value "$timestamp - $Message"
}

function Copy-Backup {
    param($Source, $Destination)

    try {
        $files = Get-ChildItem -Path $Source -File

        foreach ($file in $files) {
            Copy-Item -Path $file.FullName -Destination $Destination

            Write-Host "File $(file.Name) has been copied"
            Write-Log "File $(file.Name) has been copied"
        }
    }
    catch {
        Write-Host "Error when copying"
        Write-Log "Error when copying: $($_.Exception.Message)"
    }
}

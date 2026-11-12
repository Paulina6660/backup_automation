# Backup Automation

### Goal  
The goal of this project is to create simple automated backup using Terraform > Powershell.  
Terraform creates the folders required and Powershell copies files from data to backup folder.  
### Method  
- **Terraform:** to create folders and files.
- **Powershell:** to copy and  check files.
- **VS Code:** to write the code.
- **WSL2 Ubuntu:** to run the project.  
### Result
The project can create folders automatically and copy files to backup folder.  
Powershell uses three functions:  
- `Write-Log` - writes to a log file.
- `Copy-Backup` - copies files.
- `Test-Backup` - checks that the files exist in backup folder.  
## Installation and Usage
1. Open project folder in terminal.
2. Run `terraform init`
3. Run `terraform apply`
4. Create files in data folder.
5. Run `pwsh ./backup.ps1`
6. Check backup folder and log file.

## Reflection
I have learned how Terraform and Powershell can work together to automate work.  
Hardest part was getting the tools to work together in WSL2.

### Github
Link: [Project repository](https://github.com/Paulina6660/backup_automation)
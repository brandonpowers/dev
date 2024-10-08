# Check if the script is running as an administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script must be run as an Administrator." -ForegroundColor Magenta
    Exit 1
}

Write-Host "Installing dev tools with elevated privileges." -ForegroundColor Cyan

Set-ExecutionPolicy RemoteSigned

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Productivity
choco install -y office365business
choco install -y 1password
choco install -y googlechrome
choco install -y slack
choco install -y zoom
choco install -y zoom-outlook

# Dev Tools
choco install -y powershell-core
choco install -y git
choco install -y github-cli
choco install -y awscli
choco install -y azure-cli
choco install -y poshgit
choco install -y oh-my-posh
choco install -y powertoys
choco install -y python
choco install -y nvm
nvm install node

# Virtualization / Containerization
choco install -y docker-desktop
choco install -y vagrant
choco install -y vagrant-manager

# IDEs & Editors
choco install -y vscode
choco install -y visualstudio2022community --package-parameters "--add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.VisualStudio.Workload.NetWeb"
choco install -y obsidian
choco install -y figma

# Prompt the user for their Git username
$userName = Read-Host -Prompt "Enter your Git name [first last]: "

# Prompt the user for their Git email
$userEmail = Read-Host -Prompt "Enter your Git email: "

# Set the Git username
git config --global user.name "$userName"

# Set the Git email
git config --global user.email "$userEmail"

# Output the set values to confirm
Write-Host "Git username set to: $userName"
Write-Host "Git email set to: $userEmail"

# Set the default git branch to main
git config --global init.defaultBranch main

# Set vscode as default git editor
git config --global core.editor 'code --wait'

# Set vscode as default git diff tool
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'

# Set vscode as default git merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

Write-Host "Complete!" -ForegroundColor Cyan

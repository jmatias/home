Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

choco install git.install --params "/NoGitLfs"
choco install -y vscode pwsh vcxsrv jetbrainsmono
scoop install starship

wsl --install -d Ubuntu

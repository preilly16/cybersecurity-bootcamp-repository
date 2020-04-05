#Requires -RunAsAdministrator
#configures VSCode to always run as admin
if(!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers")){
    New-Item -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers'
}
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name "C:\\Program Files\\Microsoft VS Code\\Code.exe" -Value "~ RUNASADMIN" | Out-Null

#install the VSCode Powershell Extension
code --install-extension ms-vscode.powershell

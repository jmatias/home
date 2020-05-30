Get-VSSetupInstance | Select-VSSetupInstance -Latest | select -Property InstanceId,InstallationPath | Tee-Object -Variable myVar
Import-Module -Name  "$($myVar.InstallationPath)\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell $myvar.InstanceId -StartInPath $PWD
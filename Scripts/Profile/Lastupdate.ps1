#hashchecker
$path = 'C:\Users\alex4\Documents\PowerShell\Microsoft.Powershell_profile.ps1'
Get-FileHash $path | foreach { $hash = $_.Hash }
if($hash -eq '3EB598B294D8F8DC3D8F73F18C241A5745BAFEBD47AEA8196C147AA45E377479'){
Write-Host "File-Hash Verified. Profile loaded successfully!" -ForegroundColor Green
}else{
Write-Host "Warning! "-NoNewline -ForegroundColor Red; Write-Host "File-Hash does not match the stored value."
Write-Host "Proceed?" -NoNewline; Write-Host "(" -NoNewline; Write-Host "Y" -NoNewline -ForegroundColor Red
Write-Host "|" -NoNewline; Write-Host "N" -NoNewline -ForegroundColor Green; Write-Host "): " -NoNewline; $check = Read-Host

    $affirm = 'y','Y'
    if($check -ne $affirm){
        $options = Read-Host "View Profile: [V], Close Powershell: [C]"
        $option1 = 'v','V'
        $option2 = 'c','C'
        if($options = $option1){
        notepad $profile
        }else{
        Stop-Process -Name pwsh
        }
    }else{
    }
}

#update timer
Get-Item $path | foreach { $lwt = $_.LastWriteTime }
$time = Get-Date
$Diff = $time - $lwt
$days = ([string]$Diff.Days).PadLeft(2,'0')
$hrs = ([string]$Diff.Hours).PadLeft(2,'0')
$min = ([string]$Diff.Minutes).PadLeft(2,'0')
Write-Host "`nTime since last profile update: $days`:$hrs`:$min" -ForegroundColor Green
Write-Host "                                DD:HH:MM" -ForegroundColor Cyan
Get-ChildItem "C:\Users\alex4\Documents\PowerShell" -Filter "Microsoft.PowerShell_profile.ps1" | Get-ItemProperty | Foreach {
$pslastuse=$_.LastWriteTime }
$currenttime = Get-Date
$mdifference = ($currenttime - $pslastuse).Minutes
$hdifference = ($currenttime - $pslastuse).Hours
$ddifference = ($currenttime - $pslastuse).Days
if(($ddifference -lt 10) -and ($hdifference -ge 10) -and ($mdifference -ge 10)){
 Write-Host `nProfile Loaded Successfully`nTime since last profile modification: 0$ddifference":"$hdifference":"$mdifference -ForegroundColor Green
  Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
 }elseif(($ddifference -lt 10) -and ($hdifference -lt 10) -and ($mdifference -ge 10)){
 Write-Host `nProfile Loaded Successfully`nTime since last profile modification: 0$ddifference":0"$hdifference":"$mdifference -ForegroundColor Green
  Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
 }elseif(($ddifference -lt 10) -and ($hdifference -lt 10) -and ($mdifference -lt 10)){
  Write-Host `nProfile Loaded Successfully`nTime since last profile modification: 0$ddifference":0"$hdifference":0"$mdifference -ForegroundColor Green
   Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
  }elseif(($ddifference -ge 10) -and ($hdifference -lt 10) -and ($mdifference -ge 10)){
  Write-Host `nProfile Loaded Successfully`nTime since last profile modification: $ddifference":0"$hdifference":"$mdifference -ForegroundColor Green
   Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
  }elseif(($ddifference -ge 10) -and ($hdifference -lt 10) -and ($mdifference -lt 10)){
  Write-Host `nProfile Loaded Successfully`nTime since last profile modification: $ddifference":0"$hdifference":0"$mdifference -ForegroundColor Green
   Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
}else{
  Write-Host `nProfile Loaded Successfully`nTime since last profile modification: $ddifference":"$hdifference":0"$mdifference -ForegroundColor Green
   Write-Host "                                      DD:HH:MM" -ForegroundColor Blue
  }
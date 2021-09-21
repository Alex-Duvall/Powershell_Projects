$date = (Get-Date -DisplayHint Date)
$Phase = Read-Host -Prompt 'Phase of Remediation'
$location = Read-Host -Prompt 'Location of Corrective Action'
$event = Read-Host -Prompt 'Description of Corrective Action'
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach {
$initlinecount=$_.Length }
 #writes the remediation notes to the existing event log
Add-Content -Path C:\Users\alex4\Desktop\scenario.txt "`n$date`nPhase: $Phase`nLocation: $location`nDescription: $event"
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach { 
$newlinecount=$_.length }
if($initlinecount -lt $newlinecount) {
Write-Host "Log Updated Successfully!" -ForegroundColor Green
}else{
Write-Host "Error: Log Failed to Update" -ForegroundColor Red
}
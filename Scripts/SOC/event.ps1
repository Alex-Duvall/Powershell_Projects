$date = (Get-Date -DisplayHint Date)
$time = Get-Date -DisplayHint Time
$timeoccured = Read-Host -Prompt 'Time of Occurance'
$source = Read-Host -Prompt 'Source of Event'
$event = Read-Host -Prompt 'Description of Event'
$initialize = Test-Path -Path C:\Users\alex4\Desktop\scenario.txt 

if($initialize -eq $true){
Add-Content -Path C:\Users\alex4\Desktop\scenario.txt "`n$time`nTime of Occurance: $timeoccured`nSource: $source`nDescription: $event"
}else{
#assigning new-item to $null to supress output on the command line
$null = New-Item -Path C:\Users\alex4\Desktop\scenario.txt; $null; Add-Content -Path C:\Users\alex4\Desktop\scenario.txt "$time`n$timeoccured`nSource: $source`nDescription: $event"
}
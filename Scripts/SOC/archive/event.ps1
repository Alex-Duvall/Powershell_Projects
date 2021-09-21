$time = Get-Date
$timeoccured = Read-Host -Prompt 'Time of Occurance'
$source = Read-Host -Prompt 'Source of Event'
$event = Read-Host -Prompt 'Description of Event'
$initialize = Test-Path -Path C:\Users\alex4\Desktop\scenario.txt 

#check if file already exists
if($initialize -eq $true){
#set variable to verify the file updates properly
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach {
$initlinecount=$_.Length }
#add the new data to the file
Add-Content -Path C:\Users\alex4\Desktop\scenario.txt "`n$time`nTime of Occurance: $timeoccured`nSource: $source`nDescription: $event"
}else{
#assigning new-item to $null to supress output on the command line
$null = New-Item -Path C:\Users\alex4\Desktop\scenario.txt
$initlinecount = 0
$null; Add-Content -Path C:\Users\alex4\Desktop\scenario.txt "$time`nTime of Occurance: $timeoccured`nSource: $source`nDescription: $event"
}
#verify that the log has been updated
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach { 
$newlinecount=$_.length }
if($initlinecount -lt $newlinecount) {
Write-Host "Log Updated Successfully!" -ForegroundColor Green
}else{
Write-Host "Error: Log Failed to Update" -ForegroundColor Red
}
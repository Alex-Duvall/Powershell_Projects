#filepath
$filepath = 'C:\Users\alex4\Desktop\scenario.txt'

#filecheck
$filecheck = Test-Path -Path $filepath
$wtime = Get-Date -Format "dddd, MM/dd/yyyy"
if($filecheck -eq $true){
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach {
$initlinecount=$_.Length }
Write-Host 'Writing to scenario.txt...' -ForegroundColor Green
}else{
$initlinecount = 0
$null = New-Item -Path $filepath
$null; Write-Host 'File Created: scenario.txt' -ForegroundColor Yellow;
Add-Content -Path $filepath "Documentation of Events occuring on $wtime"
}

#user input 

#timecheck for time of occurance 
$timecheck = Read-Host "`nIs the detected anomoly acting in real-time?: y/n"
if(($timecheck -eq 'y') -or ($timecheck -eq 'Y')){
$sametime = $true
}else{
$sametime = $false
$occurancetime = read-host 'Time of Occurance' 
}

#source
$sourcecheck = Read-Host "`nHow was the Anomoly Detected? `n
Event Logs: [L], SIEM: [S], Suspicious File: [F]"
if(($sourcecheck -eq 'S') -or ($sourcecheck -eq 's')){
$source = Read-Host "`nName of SIEM tool"
$detail1 = Read-host "Alert Type"
}elseif(($sourcecheck -eq 'L') -or ($sourcecheck -eq 'l')){
$source = Read-Host "`nName of Log"
$detail1 = Read-Host "Log Source IP/Workstation"
}else{
$source = Read-Host "`nName of File"
$detail1 = Read-Host "Path/Workstation"
}

#Description
$desc = Read-Host "Description of event"

#output user data to .txt doc
$time = Get-Date

if(($sourcecheck -eq 'S') -or ($sourcecheck -eq 's')){

    if($sametime -eq $true){
    Add-Content -Path $filepath "`nTime of Detection/Occurance: $time `nDetected on: $source `nAlert Type: $detail1 `nDescription: $desc"
    }else{
    Add-Content -Path $filepath "`nTime of Detection: $time `nTime of Occurance: $occurancetime n`Detected on: $source `nAlert Type: $detail1 `nDescription: $desc"
    }

}elseif(($sourcecheck -eq 'L') -or ($sourcecheck -eq 'l')){

    if($sametime -eq $true){
    Add-Content -Path $filepath "`nTime of Detection/Occurance: $time `nLog: $source `nLog Source IP/Workstation: $detail1 `nDescription: $desc"
    }else{
    Add-Content -Path $filepath "`nTime of Detection: $time `nTime of Occurance: $occurancetime `nLog: $source `nLog Source IP/Workstation: $detail1 `nDescription: $desc"
    }

}else{

    if($sametime -eq $true){
    Add-Content -Path $filepath "`nTime of Detection/Occurance: $time `nFile Name: $source `nPath/Workstation: $detail1 `nDescription: $desc"
    }else{
    Add-Content -Path $filepath "`nTime of Detection: $time `nTime of Occurance: $occurancetime `nFile Name: $source `nPath/Workstation: $detail1 `nDescription: $desc"
    }
}
#verify that the log has been updated
Get-ChildItem C:\Users\alex4\Desktop\scenario.txt | Get-ItemProperty | foreach { 
$newlinecount=$_.length }
if($initlinecount -lt $newlinecount) {
Write-Host "Log Updated Successfully!" -ForegroundColor Green
}else{
Write-Host "Error: Log Failed to Update" -ForegroundColor Red
}
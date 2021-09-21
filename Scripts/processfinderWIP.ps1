#process finder 
Write-Host "`nWelcome to Process Finder! What can I help you find?"
Write-Host "`nShow All: [A] Specify Name: [N] Specify PID: [I]: " -NoNewline ; $input = Read-Host

#check initial filter input
while("A","N","I" -notcontains $input){
Write-Host "Invalid Input. Please Try again." -ForegroundColor Red 
Write-host "`nShow all running processes: [A] Specify Name: [N] Specify PID: [I]: " -NoNewline ; $input = Read-Host
}

#set initial filter
switch($input){
'A' {Get-Process}
'N' {$rawname = Read-Host "Process Name" 
    #verify name exists
        $namecheck = Get-Process
        While ($rawname -notin $namecheck.ProcessName){
        Write-Host "Invalid Input. Please Try again." -ForegroundColor Red
        $rawname = Read-host "Process Name"
        }
    }
'I' {$ids = Read-host "Process ID" }
}
#convert raw data into array data
$names = $rawname | out-string

#add additional filters
$nonew = Read-Host "Add another filter? [Y/N]" 
while("Y","N" -notcontains $nonew){
Write-Host "Invalid Input. Please Try again." -ForegroundColor Red 
Write-host "`nAdd another filter? [Y/N]: " -NoNewline ; $nonew = Read-Host
}

while($nonew -eq 'Y'){
$addfilter = Read-Host "Add Process Name: [N], Add Process ID: [I], Cancel: [C]"
    switch($addfilter){
    'N' { $addname = Read-Host "Process Name" ; $names = $names + ", $addname"; $nonew = Read-host "Add another filter? [Y/N]" }
    'I' { $addid = Read-host "Process ID" ; $ids = $ids + ", $addid"; $nonew = read-host "Add another filter? [Y/N]" }
    'C' { $nonew = read-host "Add another filter? [Y/N]" }
    }
}

Get-Process | where { $_.ProcessName -in $names }

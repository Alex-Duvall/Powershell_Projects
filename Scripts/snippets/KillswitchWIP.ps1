netstat -ano | Tee-Object -Variable a 
$a[3..$a.count] |select -Property PID| where State -eq 'Established'
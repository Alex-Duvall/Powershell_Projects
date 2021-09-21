$hour = get-date -Format "HH"
if(($hour -in 0..3) -or ($hour -in 21..23)){
write-host("Welcome, Alex!`nYou're up late!`n") -ForegroundColor Green
}elseif($hour -in 4..11){
Write-Host("Welcome, Alex!`nGood Morning!`n") -ForegroundColor Green
}elseif($hour -in 13..18){
Write-Host("Welcome, Alex!`nGood Afternoon!`n") -ForegroundColor Green
}else{
Write-Host("Welcome, Alex!`nGood Evening!`n") -ForegroundColor Green
}
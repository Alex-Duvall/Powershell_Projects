Get-Item C:\Users\alex4\*.* | Foreach {
$lastupdatetime=$_.LastWriteTime
$nowtime = get-date
if (($nowtime - $lastupdatetime).totalhours -le 2)
{
Write-Host "File modified within 2 hours "$_.Name
}
else
{
Write-Host "File modified before 2 hours ago"
}
}
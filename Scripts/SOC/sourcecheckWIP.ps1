
$sourcecheck = Read-Host "`nHow was the Anomoly Detected? `n
Event Logs: [L], SIEM: [S], Suspicious File: [F]"
for ($allaccepted = 'l','L','s','S','f','F'; $sourcecheck -notin $allaccepted; (Write-Host "`nInvalid Input. Please Try again." -ForegroundColor Red), (Read-Host "`nHow was the Anomoly Detected? `n
Event Logs: [L], SIEM: [S], Suspicious File: [F]"))
{
}
Write-Host 'Condition Passed' -ForegroundColor Green

#move to my user directory
cd C:\Users\alex4\

#clear Microsoft mumbo jumbo 
clear

# Profile load confirmation and edit timer
& "C:\Users\alex4\Documents\Powershell\Scripts\Profile\Lastupdate.ps1"

# Welcome message
& "C:\Users\alex4\Documents\Powershell\Scripts\Profile\welcome script2.ps1"

#set PS colors 
Set-PSReadLineOption -Colors @{ "Command"="#f2ff00" } | Set-PSReadLineOption -Colors @{ "Error"="#e36019" } | Set-PSReadLineOption -Colors @{ "Operator"="#ff00ee" } | Set-PSReadLineOption -Colors @{ "Variable"="#5eff00" } | Set-PSReadLineOption -Colors @{ "Type"="#ffc400" } | 
  Set-PSReadLineOption -Colors @{ "String"="#00ffcc" } | Set-PSReadLineOption -Colors @{ "Parameter"="#00f7ff" } | Set-PSReadLineOption -Colors @{ "InlinePrediction"="#a7c4af"} | Set-PSReadLineOption -Colors @{ "Comment"="#fcbbfa" }
#enable text prediction
Set-PSReadLineOption -PredictionSource History

#List of Functions

# edit the powershell profile
Function Edit-Profile {notepad $Profile}

#see basic computer information
Function Get-SystemInformation
{
    # Computer System
    Get-WmiObject -Class Win32_ComputerSystem
    # Operating System
    Get-WmiObject -class win32_OperatingSystem
    # BIOS
    Get-WmiObject -class win32_BIOS
}

#List of Variables

#sets the $event variable to call the event.ps1 script
set-variable -name event -Value C:\Users\alex4\Documents\Powershell\Scripts\SOC\event2.ps1
#sets the $fix variable to call fix.ps1 script
set-variable -name fix -Value C:\Users\alex4\Documents\Powershell\Scripts\SOC\fix.ps1
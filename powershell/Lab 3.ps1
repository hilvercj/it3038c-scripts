function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
}
$IP = getIP
Write-host("This machine's IP is $IP")
function getUser {
    (Get-LocalUser).Name | Select-String "Admin*"
}
$User = getUser
Write-host("User is $User")
function getHost {
    (Get-Host).Name
}
$Name = getHost
write-host("Hostname is $Name")
function getVersion {
    (Get-Host).Version
}
$Version = getVersion
write-host("Powershell Version is $Version")
function getDay {
    (Get-Date).DayOfWeek
    (Get-Date).Date
}
$Day = getDay
write-host("Today's Date is $Day")
out-file C:\it3038c-scripts\powershell\Lab_3.txt
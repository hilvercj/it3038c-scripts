function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
}
write-host(getIP)
$IP = getIP
Write-host("This machine's IP is $IP")
Write-host("This machine's IP is {0}" -f $IP)
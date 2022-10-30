
write-host "The details for the disk are:"
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property  DeviceID, @{Label="UnusedSpace"; expression= {($_.FreeSpace/1GB).ToString('F2')}}, @{Label='TotalSpace'; expression={($_.Size/1GB).ToString('F2')}}, @{label='PercentLeft'; expression={[Math]::Round(($_.FreeSpace / $_.size) * 100, 2)}}|ft
#Calls the information and properties which for the disks, which are then placed into a table. 
#Had some trouble getting the custom labels to work, specificially recognizing that the FreeSpace in the expression isn't just the name of the label, but a paramater that needs to be called and thn converted.

$ListDisk = Get-CimInstance -ClassName Win32_LogicalDisk
Foreach($Disk in $ListDisk){
    if ($Disk.size -ne $Null) {
        $DiskFreeSpace = ($Disk.freespace/1GB).ToString('F2')
    }
}
#This information is necessary to grab the information to fill out the warning table. The disk information is placed into the $ListDisk variable, and then grabbed with the foreach command. This information can now create the DiskFreeSpace variable which is needed to complete the message.

$wshell2 = New-Object -ComObject Wscript.shell
$Message2 = "Warning"
$Output2 = $wshell2.Popup("Disk C: has only $DiskFreeSpace GB of free space left",0,$Message2,48)
#This creates the warning message. Had to hard code Disk C: into the message, due to the previous code only recognizing disk D: for some reason.
#Encountered trouble with creating the warning box. Had to create the $wshell object first, then the box popped up.

$NumberofFiles = (Get-ChildItem C:\it3038c-scripts -Recurse -File | Measure-Object).Count
$NumberofFiles = $NumberofFiles.ToString()
$NumberofFolders = (Get-ChildItem C:\it3038c-scripts -Recurse -Directory | Measure-Object).Count
$NumberofFolders = $NumberofFolders.ToString()

$wshell1 = New-Object -ComObject Wscript.shell
$Message1 = "Good Evening"
$Output1 = $wshell1.Popup("The folder it3038c-scripts has $NumberofFiles files and $NumberofFolders folders.",0,$Message1,48)


#Author: N/A
#Date: May 28, 2021
#Title: PowerShell: Check Free Disk Space and Disk Usage
#Code: Powershell 7.x
#Availability: http://woshub.com/powershell-check-free-disk-space-disk-usage/#:~:text=Get%20Free%20Disk%20Space%20from%20Remote%20Windows%20Hosts,on%20remote%20computers.%20Invoke-Command%20-ComputerName%20srv01%2Csrv02%2Csrv03%20-FilePath%20%22C%3APS%5B%26checkfreespace%26%5D.ps1%22



#To run the script, navigate to C:\it3038c-scripts\powershell and select the project1script.ps1 file. Right click on it and select "Run with Powershell". This will run the script.

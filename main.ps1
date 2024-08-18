# Simple script to retrieve deep OS information

# Function to gather OS Information
function Get-OSInformation {
    # Get OS basic information
    Write-Host "OS Name: " (Get-WmiObject -Class Win32_OperatingSystem).Caption
    Write-Host "Version: " (Get-WmiObject -Class Win32_OperatingSystem).Version
    Write-Host "Build Number: " (Get-WmiObject -Class Win32_OperatingSystem).BuildNumber
    Write-Host "Architecture: " (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture
    
    # Get Computer Name and Domain Information
    Write-Host "Computer Name: " $env:COMPUTERNAME
    Write-Host "Domain: " (Get-WmiObject -Class Win32_ComputerSystem).Domain
    Write-Host "Workgroup: " (Get-WmiObject -Class Win32_ComputerSystem).Workgroup
    
    # Get Last Boot Time
    Write-Host "Last Boot Time: " (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
    
    # Get System Manufacturer and Model
    Write-Host "System Manufacturer: " (Get-WmiObject -Class Win32_ComputerSystem).Manufacturer
    Write-Host "System Model: " (Get-WmiObject -Class Win32_ComputerSystem).Model
    
    # Get Uptime
    $uptime = (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
    $uptimeDuration = (Get-Date) - $uptime
    Write-Host "System Uptime (Days): " $uptimeDuration.Days
}

# Execution Starts Here
Get-OSInformation | ConvertTo-Html

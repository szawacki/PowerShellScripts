function Disable-IEESC
{
    <#

        .SYNOPSIS

        Disable Internet Explorer Enhanced Security.



        .DESCRIPTION

        Disable Internet Explorer Enhanced Security on Microsoft Windows Servers.


        .Parameter TurnOffProtectedMode
        
        Disable Internet Explorer Protected Mode.
        
        

        .EXAMPLE 

        Disable-IEESC

    #>

    Param([switch]$TurnOffProtectedMode
    )
    
    try
    {
        $RegKey1 = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}”
        $RegKey2 = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}”
        $RegKey3 = “HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3”
        
        Set-ItemProperty -Path $RegKey1 -Name “IsInstalled” -Value 0
        Set-ItemProperty -Path $RegKey2 -Name “IsInstalled” -Value 0
        
        if ($TurnOffProtectedMode)
        {
            Set-ItemProperty -Path $RegKey3 -Name “2500” -Value 3
        }
        
        Stop-Process -Name Explorer
        Write-Host “IE Enhanced Security has been disabled.” -ForegroundColor Green
    }
    catch
    {
        Write-Host “Failed to disable IE Enhanced Security.” -ForegroundColor Red
    }
}

Function Test-IsAdmin
{
    <#

        .SYNOPSIS

        Check if current user is member of local administrators group.



        .DESCRIPTION

        This function checks if the user running the script is amember of the local administrators group.



        .EXAMPLE 

        Test-IsAdmin

    #>

    ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

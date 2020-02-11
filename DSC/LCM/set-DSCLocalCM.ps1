[CmdletBinding()]
# Parameter help description
Param(
    [Parameter(Mandatory=$true)]   
    [String]$RefreshMode,
    [Parameter(Mandatory=$true)]   
    [String]$ConfigPath
  
)

#[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    param
    (
        [string]$RefreshMode
    )
    Node localhost
    {
        LocalConfigurationManager
        {
            RefreshMode = $RefreshMode
        }
    }
}

LCMConfig -RefreshMode $RefreshMode -OutputPath $ConfigPath
#see https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/set-wsmanquickconfig?view=powershell-6
Set-WSManQuickConfig -Force
Set-DscLocalConfigurationManager -ComputerName localhost -Path $ConfigPath

  
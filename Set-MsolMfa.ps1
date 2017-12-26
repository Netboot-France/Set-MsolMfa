Function Set-MsolMfa {
    <#  
        .SYNOPSIS  
            Simple function to set MFA

        .NOTES  
            File Name    : Set-MsolMfa.ps1
            Author       : Thomas ILLIET, contact@thomas-illiet.fr
            Date	     : 2017-08-06
            Last Update  : 2017-08-06
            Tested Date  : 2017-10-16
            Version	     : 1.0.1
            
        .REQUIRE
            Software :
                + Microsoft Online Services Sign-In Assistant
                    - https://www.microsoft.com/en-us/download/details.aspx?id=41950
                + Azure Active Directory PowerShell V1
                    - http://connect.microsoft.com/site1164
            
        .PARAMETER UserPrincipalName
            Speicifies the user ID of the user to retrieve.

        .PARAMETER Status
            Speicifies MFA status.

        .EXAMPLE
           Set-MsolMfa -UserPrincipalName Unicorn@microsoft.com -Status Enable
    #>
    Param (
    [parameter(Mandatory=$true)]
    [String]$UserPrincipalName,

    [parameter(Mandatory=$true)]
    [ValidateSet('Enable','Disable','Enforced')]
    [String]$Status
    )

    $Error.clear();
    switch ($Status) {
        #----------------------------------------------
        # Enable MFA
        #----------------------------------------------
        Enable {
            $Sar = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
            $Sar.RelyingParty = "*"
            $Sta = @($Sar)
            Set-MsolUser -UserPrincipalName $UserPrincipalName -StrongAuthenticationRequirements $Sta
        }

        Disable {
            #----------------------------------------------
            # Enable MFA
            #----------------------------------------------
            Set-MsolUser -UserPrincipalName $UserPrincipalName -StrongAuthenticationRequirements @()
        }

        Enforced {
            #----------------------------------------------
            # Enforced MFA
            #----------------------------------------------
            $Sar = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
            $Sar.RelyingParty = "*"
            $Sar.State = "Enforced"
            $Sta = @($Sar)
            Set-MsolUser -UserPrincipalName $UserPrincipalName -StrongAuthenticationRequirements $Sta
        }
    }

    # Return Management
    if([string]::IsNullOrEmpty($error))
    {
        return $true
    }
    else
    {
        return $false
    } # END Return Management

}
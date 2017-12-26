# Set-MsolMfa

## SYNOPSIS  
Simple function to set MFA

## NOTES  
  - **File Name**    : Set-MsolMfa.ps1
  - **Author**       : Thomas ILLIET, contact@thomas-illiet.fr
  - **Date**         : 2017-08-06
  - **Last Update**  : 2017-08-06
  - **Tested Date**  : 2017-10-16
  - **Version**      : 1.0.1
    
## REQUIRE
  - **Software** :
    - Microsoft Online Services Sign-In Assistant
      - https://www.microsoft.com/en-us/download/details.aspx?id=41950
    - Azure Active Directory PowerShell V1
      - http://connect.microsoft.com/site1164
    
## EXAMPLE
```
Set-MsolMfa -UserPrincipalName Unicorn@microsoft.com -Status Enable
```
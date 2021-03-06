﻿#  Register assemblies for strong name verification skipping

$registryPath = "HKLM:\SOFTWARE\Microsoft\StrongName\Verification"
$publicKeyToken="31bf3856ad364e35"
$assemblies = "Microsoft.ServiceFabric.AspNetCore",
              "Microsoft.ServiceFabric.AspNetCore.Configuration",              
              "Microsoft.ServiceFabric.AspNetCore.HttpSys",
              "Microsoft.ServiceFabric.AspNetCore.Kestrel",
              "Microsoft.ServiceFabric.AspNetCore.WebListener",
              "Microsoft.ServiceFabric.AspNetCore.Tests"

Write-Host "Registering assemblies generated by this repository for strong name verification skipping."
foreach ($assembly in $assemblies)
{
    $assemblyIdentity = "$assembly,$publicKeyToken"
    New-Item -Path "$registryPath\$assemblyIdentity" -Force | Out-Null
}

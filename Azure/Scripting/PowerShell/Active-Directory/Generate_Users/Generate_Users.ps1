$USER_LIST = Get-Content .\names.txt
New-ADOrganizationalUnit -Name "PowerShell Users" -ProtectedFromAccidentalDeletion $false

foreach ($n in $USER_LIST) {
    $first = $n.Split(" ")[0]
    $last = $n.Split(" ")[1]
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    $password = ConvertTo-SecureString "!password1" -AsPlainText -Force

    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $n `
               -Name $n `
               -SamAccountName $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=PowerShell Users,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true

    Write-Host "$n (User Account: $username) is now active."
}
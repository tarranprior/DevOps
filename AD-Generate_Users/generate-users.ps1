$USER_LIST = Get-Content .\names.txt
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false

foreach ($n in $USER_LIST) {
    $first = $n.Split(" ")[0]
    $last = $n.Split(" ")[1]
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    $password = ConvertTo-SecureString "!password1" -AsPlainText -Force

    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true

    Write-Host "User account: $($username) is now active."
}
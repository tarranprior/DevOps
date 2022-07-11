# Get contents of text file and store names in a new variable called "USER_LIST".
$NAMES_LIST = Get-Content .\Names.txt

# Create an OU for new users.
New-ADOrganizationalUnit -Name "New Users" -ProtectedFromAccidentalDeletion $false

# Enumerate through the list of users.
foreach ($n in $NAMES_LIST) {
    $first = $n.Split(" ")[0]
    $last = $n.Split(" ")[1]
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    $password = ConvertTo-SecureString "!password1" -AsPlainText -Force

    # Create user account with given properties.
    New-ADUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $n `
               -Name $n `
               -SamAccountName $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "OU=New Users,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true

    #  Print output to the terminal.
    Write-Host "$n (User Account: $username) is now active."
}
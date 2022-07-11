# Import the .csv data in a new variable called "USER_LIST".
$USER_LIST = Import-Csv -Path ./Employees.csv

# Create the parent OU for new employees.
New-ADOrganizationalUnit -Name "New Employees" -ProtectedFromAccidentalDeletion $false

# Enumerate through the list of users.
foreach ($u in $USER_LIST) {
    $first = $u.FirstName
    $last = $u.LastName
    $full = "$first $last"
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    $password = ConvertTo-SecureString "!password1" -AsPlainText -Force
    $office = $u.Office

    # Check if OU exists for each office.
    if (Get-ADOrganizationalUnit -Filter "distinguishedName -like 'OU=$office,OU=New Employees,$(([ADSI]`"").distinguishedName)'") {
    } else {
    New-ADOrganizationalUnit -Name $office -Path "OU=New Employees,$(([ADSI]`"").distinguishedName)" -ProtectedFromAccidentalDeletion $false
    }

    # Create user with given properties.
    New-ADUser `
        -AccountPassword $password `
        -GivenName $first `
        -Surname $last `
        -DisplayName $full `
        -Name $full `
        -SamAccountName $username `
        -EmployeeID $username `
        -PasswordNeverExpires $true `
        -Path "OU=$office,OU=New Employees,$(([ADSI]`"").distinguishedName)" `
        -Enabled $true

    # Add user to global group called "Sales".
    Add-ADGroupMember `
        -Identity "Sales" `
        -Members $username

    # Print output to the terminal.
    Write-Host "$full's account has been created under $office and added to Sales."
}
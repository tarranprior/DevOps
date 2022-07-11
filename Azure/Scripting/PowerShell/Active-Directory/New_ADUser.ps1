New-ADUser `
    -Name "Max Headroom" `
    -GivenName "Max" `
    -Surname "Headroom" `
    -SamAccountName "mheadroom" `
    -EmployeeID "mheadroom" `
    -AccountPassword ConvertTo-SecureString "!pw1" -AsPlainText -Force `
    -ChangePasswordAtLogon $true `
    -Path "OU=Users,DC=homelab,DC=local"
    -Enabled $true
Get-ADUser `
    -Filter 'Surname -like "Headroom"' `
    -Properties Name, Department ` | Select-Object Name, Department
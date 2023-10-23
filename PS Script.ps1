Import-Module ActiveDirectory
$users = Import-Csv -LiteralPath "C:\Users\SuperSalmon\Desktop\PowerShell Spreadsheet.csv"
foreach ($user in $users)
{
    $UserName = $user.UserName
    $DisplayName = $user.Display
    $path = $user.Path
    $Password = $user.Password
    $upn = $user.PrincipalName
    $FirstName = $user.FirstName
    $LastName = $user.LastName
    $Title = $user.Title
    New-ADUser -Name $UserName -DisplayName $DisplayName -UserPrincipalName $upn -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
    -Enabled $true -ChangePasswordAtLogon $false -Path "$path" -Surname $FirstName -GivenName $LastName -Title $Title
    }
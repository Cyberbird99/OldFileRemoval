# You can clean your old unnecessary files automatically after some time
# I do not keep files in Downloads. 
# I put them in folders to organize carefully.
# So, if a file stays longer than a week in Downloads folder, it means it must be deleted.

$DirectoryListFile="C:Users\VM01\GitHubProjects\LogDirectories.csv"
$DirectoryList=Import-Csv -Path $DirectoryListFile
foreach($Directory in $DirectoryList){
    Get-ChildItem -Path $Directory.$DirectoryPath `
    | Where-Object LastWriteTime -lt $(Get-Date).AddDays(-$DirectoryList.KeepForDays) `
    | Remove-Item -Confirm:$false -Force -WhatIf
}


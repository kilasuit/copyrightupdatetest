$configFilePath = '.\config.toml'
$Content = Get-Content -Path $configFilePath
$currentYear = (Get-Date).Year
$PreviousYear = (Get-Date).Year - 1
$UpdatedContent = $Content -replace $PreviousYear, $currentYear
Set-Content -Path $configFilePath -Value $UpdatedContent
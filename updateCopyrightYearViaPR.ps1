
$currentYear = (Get-Date).Year
$branchName = "update-copyright-year-$currentYear"
git checkout -b $branchName

$configFilePath = '.\config.toml'
$Content = Get-Content -Path $configFilePath
$currentYear = (Get-Date).Year
$PreviousYear = (Get-Date).Year - 1
$UpdatedContent = $Content -replace $PreviousYear, $currentYear
Set-Content -Path $configFilePath -Value $UpdatedContent

git config --global user.name 'github-actions[bot]'
git config --global user.email 'github-actions[bot]@users.noreply.github.com'
git add config.toml
git commit -m "Update copyright notice for the year $currentYear"
git push --set-upstream origin update-copyright-year-2025 --force

## This works locally, but I can't get it to work in the GitHub Actions workflow atm
gh pr create --title "Update copyright notice for the year $currentYear" --body "This PR updates the copyright notice for the year $currentYear" --base main --head $branchName --reviewer kilasuit --label "enhancement" --assignee kilasuit --project 'kilasuit\Sample Project'

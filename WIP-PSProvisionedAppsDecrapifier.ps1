$APPS2Uninstall = @(
    '*Office*',
    '*todos*',
    '*windowscommunicationsapps*',
    '*MicrosoftTeams*',
    '*WindowsMaps*',
    '*BingNews*',
    '*BingWeather*',
    '*GetHelp*',
    '*MixedReality*',
    '*Getstarted*',
    '*Microsoft3DViewer*',
    '*MicrosoftSolitaireCollection*',
    '*PowerAutomateDesktop*',
    '*SkypeApp*',
    '*Wallet*',
    '*WindowsFeedbackHub*',
    '*People*'
)

Write-Host -ForegroundColor Cyan "START REMOVING..."

foreach ($APPS in $APPS2Uninstall) {
    Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like $APPS} | Remove-AppxProvisionedPackage -Online -AllUsers
}

Write-Host -ForegroundColor Green "DONE !"
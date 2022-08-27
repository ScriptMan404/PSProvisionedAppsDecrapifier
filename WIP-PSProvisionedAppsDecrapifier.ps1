$APPS2Uninstall = @(
    'Office',
    'todos',
    'windowscommunicationsapps',
    'MicrosoftTeams',
    'WindowsMaps',
    'BingNews',
    'BingWeather',
    'GetHelp',
    'MixedReality',
    'Getstarted',
    'Microsoft3DViewer',
    'MicrosoftSolitaireCollection',
    'PowerAutomateDesktop',
    'SkypeApp',
    'Wallet',
    'WindowsFeedbackHub',
    'People',
    'Zune',
    'MSPaint',
    'YourPhone'
)

$TOTALItems = $APPS2Uninstall.Count
$CURRENTItem = 0
$PERCENTComplete = 0

foreach ($APPS in $APPS2Uninstall) {
    Write-Progress -Activity "REMOVING PROVISIONED APPS..." -Status "$PERCENTComplete% Complete:" -PercentComplete $PERCENTComplete
    Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -match $APPS} | Remove-AppxProvisionedPackage -Online -AllUsers
    $CURRENTItem++
    $PERCENTComplete = [int](($CURRENTItem / $TOTALItems) * 100)
    Start-Sleep -Milliseconds 200
}